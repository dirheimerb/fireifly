import {v4 as uuidv4} from 'uuid'
import Joi from 'joi'
import Immutable from 'immutable'

export const user:Users = {
    id: uuidv4(),
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

}
export interface Users {
    id:string;
    username: string
    firstName: string
    lastName: string
    email: string
    password:string
    roles: string
    active: boolean
    createdDate: Date|number
    updatedDate: Date|number
    bio?: string
    image?: string
    hash?: string
    salt?: string
    userId: string;
}
export interface UserSearchInfo {
    id: string;
    email:string;
    name: {
        firstName:string,
        lastname:string
    }
    getUserId?: (userId:string, id:string) => {id:string,userId:string}
}
export interface UserLogin {
    username: string;
    password: string;
}
export type user = {
    id:string|undefined;
    userId:string;
    email?:string
}
export interface UserToken {
    RefreshToken: string;
    token: string;
}

export interface UserReturnedAuthrequest {
    credentials: {
        username:string;
        password: string;
    }
    token: string;
    refreshToken:string;
    userInfo: Object
}

const schema = Joi.object({
    username: Joi.string()
        .alphanum()
        .min(3)
        .max(10)
        .required(),
    password: Joi.string()
        .pattern(new RegExp('^[a-zA-Z0-9]{3,30}$')),
        repeat_password: Joi.ref('password'),
        access_token: [
            Joi.string(),
            Joi.number()
        ],
        email: Joi.string()
        .email({ minDomainSegments: 2, tlds: {allow: ['com','io']
        }}
    )}
)
        .with('password', 'access_token')
        .with('password', 'repeat_password')

    schema.validate({username: 'abc'})


    var mapper: Immutable.Map<string,number>
        mapper = Immutable.Map({a:1,b:2,c:3})

    var mapperMatcher = mapper.set('b', 50)
    mapper.get('b')
    mapperMatcher.get('b')