const express = require('express');
const router = express.Router();
const db = require('../db/database')

router.post('/authenticate', async (request, response)=>{

    // console.log(request.body)
    try{
        var res = await db.authenticateTeacher(request.body);
        response.status(200).send(res)
    }catch(e){
        response.status(404).send({
            "error" : "user not found"
        });
        console.log('Authentication failed');
    }
})

module.exports = router;