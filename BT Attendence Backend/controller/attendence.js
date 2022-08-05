const express = require('express');
const router = express.Router();
const db = require('../db/database')

router.post('/mark-attendence', async (request, response)=>{

    // console.log(request.body);

    try{
        var attendence_count = await db.markAttendence(request.body);
        response.status(201).send({
            status: true,
            totalAttendenceMarked: attendence_count
        });
    }catch(e){
        response.status(401).send({
            error: e,
            status: false,
            totalAttendenceMarked: 0
        });
    }
})

module.exports = router;