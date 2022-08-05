const mysql = require('mysql2')
const bluebird = require('bluebird')
const binarySearch = require('../algorithms/binary_search')
const TimeStampController = require('../controller/controllers.time_stamp')

const establishConnection = async ()=>{
    var pool = mysql.createPool({
        'host' : 'localhost',
        'database' : 'bt_attendence',
        'user': 'root',
        'password': 'root',
        'Promise': bluebird,
        multipleStatements: true
    });

    const promisePool = pool.promise();

    console.log('Connection Established')
    return promisePool;
}

const connection = establishConnection()

var operationPerformer = {
    authenticateTeacher : async (requestBody)=>{
        // 1. Authenticate teacher through id and password.
        // 2. Send the data of the corresponding class.
        
        /*
            request JSON:
            {
                "t_id" : "12345",
                "password" : "password"
            } 
        */
        /*
            response JSON:
            {
                "class_name": "CS",
                "section_name" : "A",
                "class_n_section_id": "CSA",
            }
        */

        console.log(requestBody)
        const t_id = requestBody.t_id;
        const [result, fields] = await (await connection).execute('SELECT `class_name`, `section_name`, `class_n_section_id` from `Teacher` Natural Join `Section` where `t_id` = ?', [t_id]);

        return result;
    },
    
    markAttendence: async (requestBody)=>{
        // STEPS: 
        /*
            1. Join Mac_address table and student table
            where class_n_section_id is same.
            2. Iterate over all the (s_id)s:
                    if s_id is in request.body.s_id_list:
                        INSERT into Attendence with status 1
                    else 
                        INSERT into Attendence with status 0 
        */ 

        /*
            Request JSON:
            {
                "t_id": "12345",
                "date": DATETIME,
                "s_id_list": [s_id1, s_id2, s_id3....]
            }
        */

        const [result, fields] = await (await connection).execute(
            'SELECT s_id from Student Natural JOIN Mac_Address where class_n_section_id = (Select class_n_section_id FROM Teacher where t_id = ?) order by s_id', [requestBody.t_id]);
        console.log(result.length);
        // if(result.length == 1){
        //     var s_id_list = requestBody.s_id_list;
        //     s_id_list.sort();
        //     var timeStampController = new TimeStampController();
        //     var currentDate = timeStampController.getCurrentDate();
        //     var searchResult = binarySearch(s_id_list, requestBody.s_id_list[0]);
        //     console.log(searchResult);
        //     var status = 0;
        //     if(searchResult[0] == true){
        //         status = 1;
        //     }
        //     await (await connection).execute(
        //         'INSERT INTO Attendence(s_id, date, attendence_status, t_id) Values(?, ?, ?, ?)', [requestBody.s_id_list[0], requestBody.date, status, requestBody.t_id]
        //     );
        // }
        if(result.length >= 1){
            var counter = 0;
            var s_id_list = requestBody.s_id_list;
            s_id_list.sort();
            var timeStampController = new TimeStampController();
            var currentDate = timeStampController.getCurrentDate();
            console.log(result[0]);
            for(var record = 0; record < result.length; record++){
                console.log('IN lop')
                console.log(`record: ${result[record]}`);
                var searchResult = binarySearch(s_id_list, result[record].s_id);
                console.log(searchResult);
                var status = 0;
                if(searchResult[0] == true){
                    status = 1;
                    counter += 1;
                    console.log(counter);
                }
                await (await connection).execute(
                    'INSERT INTO Attendence(s_id, date, attendence_status, t_id) Values(?, ?, ?, ?)', [result[record].s_id, requestBody.date, status, requestBody.t_id]
                );
            }
            return counter;
        }

    }
}

module.exports = operationPerformer;