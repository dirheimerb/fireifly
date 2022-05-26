import axios from 'axios'


const api = axios.create({})
const API_URL = 'http://localhost:8080/api/auth'


function login(username:string,password:string) {
    if(username||password === null||undefined) {
        return Error('username and password requried to login')
    }
    const config = {
        method:'POST',
        url:API_URL,
        headers:{
            'Content-Type': 'application/json'
        },
        body: {
            username,
            password
        }
    }

    api(config)
    .then(function(response) {
        const data = response.data
        console.log(data)
    })
}