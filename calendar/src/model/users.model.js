"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.user = void 0;
const uuid_1 = require("uuid");
exports.user = {
    id: (0, uuid_1.v4)(),
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    username: '',
    createdDate: Date.now(),
    updatedDate: Date.now(),
    active: true,
    roles: '',
    hash: '',
    userId: ''
};
