const express = require('express')
const port = process.env.PORT || 3000;
const router = express.Router();
require('./db/database')
const bcrypt = require('bcrypt')
const teacherRoute = require('./controller/teacher')
const attendenceRoute = require('./controller/attendence')


app = express()
app.use(express.json())
app.use("/teacher", teacherRoute);
app.use("/attendence", attendenceRoute);
app.get('/', (request, response)=>{
    response.send({'runnint_status' : true})
})
app.use(router);

// bcrypt.hash('password', 10).then((hashedPass)=>{
//     console.log(hashedPass);
// });

app.listen(port, ()=>{
    console.log(`Running at ${port}`)
});