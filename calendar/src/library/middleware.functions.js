"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const users_model_1 = require("../model/users.model");
const axios_1 = __importDefault(require("axios"));
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const fs_1 = __importDefault(require("fs"));
const readline_1 = __importDefault(require("readline"));
const googleapis_1 = require("googleapis");
require("dotenv/config");
const google_auth_library_1 = require("google-auth-library");
const apis = googleapis_1.google.getSupportedAPIs();
const TOKEN_PATH = 'token.json';
const SCOPES = ['https://www.googleapis.com/auth/calendar.readonly'];
const testSecret = 'c109d7160e22d9973be78fb186b49994';
fs_1.default.readFile('credentials.json', (err, content) => {
    if (err)
        return console.log('Error loading client secret file: ', err);
    authorize(JSON.parse(content), listEvents);
});
//https://developers.google.com/oauthplayground/#step3&apisSelect=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar&auth_code=4%2F0AX4XfWib4dpolGSzI8Zj0JiCr2B25JMTU5CJvnjW3V85A4UBU3uXTHH4x-Zq_DRLqdLwTA&refresh_token=1%2F%2F04eViIdhw1xBdCgYIARAAGAQSNwF-L9IrZy2PNzJgSNGEqy0xgHQ4B2QGxqmrN6Yk_jO6eV1Ib7AvMM17g251URaYJOxEj4r4naA&access_token_field=ya29.a0ARrdaM-vce-ZBf_CPhE6PksX5UZfLC7m0Qgk_jr2IaxhqgGSKIKjvgxeC2x6iyHHMcSRTNnPA2TroNsdFNU_sz2VeimzRQGB57UFawtlateHHshqU_v58OsAF5ATF5SrL3xsJksMZjUjrm4tbaXIFYtK5Sja&url=https%3A%2F%2F&content_type=application%2Fjson&http_method=GET&useDefaultOauthCred=unchecked&oauthEndpointSelect=Google&oauthAuthEndpointValue=https%3A%2F%2Faccounts.google.com%2Fo%2Foauth2%2Fv2%2Fauth&oauthTokenEndpointValue=https%3A%2F%2Foauth2.googleapis.com%2Ftoken&expires_in=3598&access_token_issue_date=1653531462&for_access_token=ya29.a0ARrdaM-vce-ZBf_CPhE6PksX5UZfLC7m0Qgk_jr2IaxhqgGSKIKjvgxeC2x6iyHHMcSRTNnPA2TroNsdFNU_sz2VeimzRQGB57UFawtlateHHshqU_v58OsAF5ATF5SrL3xsJksMZjUjrm4tbaXIFYtK5Sja&includeCredentials=checked&accessTokenType=bearer&autoRefreshToken=unchecked&accessType=offline&prompt=consent&response_type=code&wrapLines=on
function authorize(credentials, callback) {
    const { client_secret, client_id, redirect_uris } = credentials.installed;
    const oAuth2Client = new googleapis_1.google.auth.OAuth2(client_id, client_secret, redirect_uris[0]);
}
// Check if we have previously stored a token.
fs_1.default.readFile(TOKEN_PATH, (err, token) => {
    if (err)
        return getAccessToken(oAuth2Client, google_auth_library_1.OAuth2Client, callback, Call);
    oAuth2Client.setCredentials(JSON.parse(token));
    callback(oAuth2Client);
});
function getAccessToken(oAuth2Client, callback) {
    const authUrl = oAuth2Client.generateAuthUrl({
        access_type: 'offline',
        scope: SCOPES,
    });
    console.log('Authorize this app by visiting this url:', authUrl);
    const rl = readline_1.default.createInterface({
        input: process.stdin,
        output: process.stdout,
    });
    rl.question('Enter the code from that page here: ', (code) => {
        rl.close();
        oAuth2Client.getToken(code, (err, token) => {
            if (err)
                return console.error('Error retrieving access token', err);
            oAuth2Client.setCredentials(token);
            // Store the token to disk for later program executions
            fs_1.default.writeFile(TOKEN_PATH, JSON.stringify(token), (err) => {
                if (err)
                    return console.error(err);
                console.log('Token stored to', TOKEN_PATH);
            });
            callback(oAuth2Client);
        });
    });
}
function listEvents() {
    const auth = new googleapis_1.google.auth.GoogleAuth();
    const drive = googleapis_1.google.drive({
        version: 'v3',
        auth,
    });
    calendar.events.list({
        calendarId: 'primary',
        timeMin: (new Date()).toISOString(),
        maxResults: 10,
        singleEvents: true,
        orderBy: 'startTime',
    }, (err, res) => {
        if (err)
            return console.log('The API returned an error: ' + err);
        const events = res.data.items;
        if (events.length) {
            console.log('Upcoming 10 events:');
            events.map((event, i) => {
                const start = event.start.dateTime || event.start.date;
                console.log(`${start} - ${event.summary}`);
            });
        }
        else {
            console.log('No upcoming events found.');
        }
    });
}
const db = {
    roles: 'standard',
    user: users_model_1.user.roles,
    username: users_model_1.user.username,
    password: users_model_1.user.password,
    email: users_model_1.user.email
};
const User = db.user;
const saltRounds = 10;
const myPlaintextPassword = 's0/\/\P4$$w0rD';
const someOtherPlaintextPassword = 'not_bacon';
// bcrypt.genSalt(saltRounds, function(err:Error,salt:Salt){
//     bcrypt.hash(user.password,salt,function(err:Error,hash:Hash){
//         const hashedPassord = hash
//         const match = bcrypt.compare(user.password, user.hash);
//         if(match) {
//         }
//     })
// })
const api = axios_1.default.create();
const token = jsonwebtoken_1.default.sign({ id: users_model_1.user.id }, testSecret, {
    expiresIn: 86400
});
let authorities = [];
for (let i = 0; i < users_model_1.user.roles.length; i++) {
    authorities.push("ROLE_" + users_model_1.user.roles[i].toUpperCase());
}
const config = {
    method: 'POST',
    url: 'http://localhost:3000',
    headers: {},
    body: {
        id: users_model_1.user.id,
        username: users_model_1.user.username,
        email: users_model_1.user.email,
        roles: authorities,
        accessToken: token
    }
};
const userRequest = api(config)
    .then(function (response) {
    const data = response.data;
    console.log(data);
    return data;
}).then(function (error) {
    console.log(error);
});
exports.default = {
    userRequest
};
