"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthStateEmitter = void 0;
const node_requestor_1 = require("@openid/appauth/built/node_support/node_requestor");
const EventEmitter = require("events");
class AuthStateEmitter extends EventEmitter {
}
exports.AuthStateEmitter = AuthStateEmitter;
AuthStateEmitter.ON_TOKEN_RESPONSE = 'on_token_response';
const req = new node_requestor_1.NodeRequestor();
class AppAuth {
}
