//  /// <reference path="swagger-node-express/>"

import express, { Request } from 'express'
import swagger from 'swagger-node-express'
import url from 'url'
import cors from 'cors'
import {UserSearchInfo,user} from '../src/model/users.model'
import { parse } from 'querystring'


const app = express()
var corsOptions = {
    credentials: true,
    origin: function(origin: string | undefined,callback: (arg0: null, arg1: boolean) => void) {
        if(origin===undefined) {
            callback(null,false);
        } else {
            // change wordnik.com to your allowed domain.
            var match = origin.match("^(.*)?.wordnik.com(\:[0-9]+)?");
            var allowed = (match!==null && match.length > 0);
            callback(null,allowed);
        }
    }
};

app.use(cors(corsOptions));
app.use(express.json())
app.use(express.urlencoded())

swagger.setAppHandler(app);
res.header("Access-Control-Allow-Headers", "Content-Type, X-API-KEY");
res.header("Content-Type", "application/json; charset=utf-8");


swagger.addValidator(
    function validate(req: { headers: { [x: string]: any }; url: string },path: any,httpMethod: string) {
        if("POST" == httpMethod || "DELETE" == httpMethod || "PUT" == httpMethod) {
            var apiKey = req.headers["api_key"]
             if (!apiKey) {
        apiKey = url.parse(req.url,true).query["api_key"];
      }
      if ("special-key" == apiKey) {
        return true;
      }
      return false;
    }
    return true;
  }
)

var findById = {
  'spec': {
    "description" : "Operations about pets",
    "path" : "/pet.{format}/{petId}",
    "notes" : "Returns a pet based on ID",
    "summary" : "Find pet by ID",
    "method": "GET",
    "parameters" : [swagger.pathParam("userId", "ID of pet that needs to be fetched", "string")],
    "type" : "User",
    "errorResponses" : [swagger.errors.invalid('userId'), swagger.errors.notFound('user')],
    "nickname" : "getPetById"
  },
  'action': function (req: { params: { userId: string } },res: { send: (arg0: string) => void }) {
    if (!req.params.userId) {
      throw swagger.errors.invalid('id');
    }
    var id = parse(req.params.userId);
    var user:UserSearchInfo = getUserById(id);

    if (user) {
      res.send(JSON.stringify(user));
    } else {
      throw swagger.errors.notFound('pet');
    }
  }
};

swagger.addGet(findById);

swagger.configure('http://api.fasifly.com')

app.listen(8002)

function getUserById(id: string) {
    let usr = user.id
    if(!id){
    throw new Error('Function not implemented.')
    }
    if(usr !== null)
    return(user.id)
}
