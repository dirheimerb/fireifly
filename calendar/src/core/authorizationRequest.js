"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
require("dotenv/config");
const googleapis_1 = require("googleapis");
const express_1 = __importDefault(require("express"));
const app = (0, express_1.default)();
app.use(express_1.default.json());
app.use(express_1.default.urlencoded({ extended: true }));
const CLIENT_ID = process.env.CLIENT_ID;
const CLIENT_SECRET = process.env.CLIENT_SECRET;
const REDIRECT_URL = process.env.REDIRECT_URL;
const authRequest = new googleapis_1.google.auth.OAuth2(CLIENT_ID, CLIENT_SECRET, REDIRECT_URL);
const scopes = [
    'https://www.google.com/auth/drive.metadata.readonly'
];
const authorizationUrl = authRequest.generateAuthUrl({
    access_type: 'offline',
    scope: scopes,
    include_granted_scopes: true
});
exports.default = {
    authRequest,
    authorizationUrl
};
