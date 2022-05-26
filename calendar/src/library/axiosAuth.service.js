"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const axios_1 = __importDefault(require("axios"));
const api = axios_1.default.create({});
const API_URL = 'http://localhost:8080/api/auth';
function login(username, password) {
    if (username || password === null || undefined) {
        return Error('username and password requried to login');
    }
    const config = {
        method: 'POST',
        url: API_URL,
        headers: {
            'Content-Type': 'application/json'
        },
        body: {
            username,
            password
        }
    };
    api(config)
        .then(function (response) {
        const data = response.data;
        console.log(data);
    });
}
