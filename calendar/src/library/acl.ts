import type etag from '../model/etag'

interface ACL {
    kind: string;
    id: string
    scope: {
        type: string;
        value: string;
    }
    role: string
}
