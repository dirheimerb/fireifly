"use strict";
//  /// <reference path="swagger-node-express/>"
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const swagger_node_express_1 = __importDefault(require("swagger-node-express"));
const url_1 = __importDefault(require("url"));
const cors_1 = __importDefault(require("cors"));
const users_model_1 = require("../src/model/users.model");
const querystring_1 = require("querystring");
const app = (0, express_1.default)();
var corsOptions = {
    credentials: true,
    origin: function (origin, callback) {
        if (origin === undefined) {
            callback(null, false);
        }
        else {
            // change wordnik.com to your allowed domain.
            var match = origin.match("^(.*)?.wordnik.com(\:[0-9]+)?");
            var allowed = (match !== null && match.length > 0);
            callback(null, allowed);
        }
    }
};
app.use((0, cors_1.default)(corsOptions));
app.use(express_1.default.json());
app.use(express_1.default.urlencoded());
swagger_node_express_1.default.setAppHandler(app);
res.header("Access-Control-Allow-Headers", "Content-Type, X-API-KEY");
res.header("Content-Type", "application/json; charset=utf-8");
swagger_node_express_1.default.addValidator(function validate(req, path, httpMethod) {
    if ("POST" == httpMethod || "DELETE" == httpMethod || "PUT" == httpMethod) {
        var apiKey = req.headers["api_key"];
        if (!apiKey) {
            apiKey = url_1.default.parse(req.url, true).query["api_key"];
        }
        if ("special-key" == apiKey) {
            return true;
        }
        return false;
    }
    return true;
});
var findById = {
    'spec': {
        "description": "Operations about pets",
        "path": "/pet.{format}/{petId}",
        "notes": "Returns a pet based on ID",
        "summary": "Find pet by ID",
        "method": "GET",
        "parameters": [swagger_node_express_1.default.pathParam("userId", "ID of pet that needs to be fetched", "string")],
        "type": "User",
        "errorResponses": [swagger_node_express_1.default.errors.invalid('userId'), swagger_node_express_1.default.errors.notFound('user')],
        "nickname": "getPetById"
    },
    'action': function (req, res) {
        if (!req.params.userId) {
            throw swagger_node_express_1.default.errors.invalid('id');
        }
        var id = (0, querystring_1.parse)(req.params.userId);
        var user = getUserById(id);
        if (user) {
            res.send(JSON.stringify(user));
        }
        else {
            throw swagger_node_express_1.default.errors.notFound('pet');
        }
    }
};
swagger_node_express_1.default.addGet(findById);
swagger_node_express_1.default.configure('http://api.fasifly.com');
app.listen(8002);
function getUserById(id) {
    let usr = users_model_1.user.id;
    if (!id) {
        throw new Error('Function not implemented.');
    }
    if (usr !== null)
        return (users_model_1.user.id);
}
