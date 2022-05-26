import 'dotenv/config'
import {google} from 'googleapis'
import express from 'express'

const app = express();
app.use(express.json())
app.use(express.urlencoded({ extended: true }))
const CLIENT_ID = process.env.CLIENT_ID
const CLIENT_SECRET = process.env.CLIENT_SECRET
const REDIRECT_URL = process.env.REDIRECT_URL


const authRequest = new google.auth.OAuth2(
    CLIENT_ID,
    CLIENT_SECRET,
    REDIRECT_URL
)


const scopes = [
    'https://www.google.com/auth/drive.metadata.readonly'
]

const authorizationUrl = authRequest.generateAuthUrl({
    access_type:'offline',
    scope: scopes,
    include_granted_scopes: true
})



export default {
    authRequest,
    authorizationUrl
}