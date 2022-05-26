import { AuthorizationRequest } from "@openid/appauth/built/authorization_request";
import {
  AuthorizationNotifier,
  AuthorizationRequestHandler,
  AuthorizationRequestResponse,
  BUILT_IN_PARAMETERS
} from "@openid/appauth/built/authorization_request_handler";
import { AuthorizationResponse } from "@openid/appauth/built/authorization_response";
import { AuthorizationServiceConfiguration } from "@openid/appauth/built/authorization_service_configuration";
import { NodeCrypto } from '@openid/appauth/built/node_support/';
import { NodeBasedHandler } from "@openid/appauth/built/node_support/node_request_handler";
import { NodeRequestor } from "@openid/appauth/built/node_support/node_requestor";
import {
  GRANT_TYPE_AUTHORIZATION_CODE,
  GRANT_TYPE_REFRESH_TOKEN,
  TokenRequest
} from "@openid/appauth/built/token_request";
import {
  BaseTokenRequestHandler,
  TokenRequestHandler
} from "@openid/appauth/built/token_request_handler";
import {
  TokenError,
  TokenResponse
} from "@openid/appauth/built/token_response";
import EventEmitter = require("events");
import { StringMap } from "@openid/appauth/built/types";

export class AuthStateEmitter extends EventEmitter{
    static ON_TOKEN_RESPONSE ='on_token_response'
}

const req = new NodeRequestor();


class AppAuth {
    private authFlow
}