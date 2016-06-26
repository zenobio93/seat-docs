![SeAT](http://i.imgur.com/aPPOxSK.png)

# SeAT Users

All endpoints in this document are for version1 (`/api/v1`) of the SeAT API.  
All methods below have the requests and responses sampled using [httpie](https://github.com/jkbrzt/httpie).

# Available Methods
* [List All](#list-all-users)
* [Show Detail](#show-user-detail)
* [Add a User](#add-a-seat-user)
* [Edit a User](#edit-a-user)
* [Delete a User](#delete-a-user)

***

### List all Users

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/user` |
| Description   | List all SeAT Users from the database. |

Sample Request:
```bash
http get http://localhost:8000/api/v1/user Accept:application/json X-Token:123456
```

Sample Response:
```json
[
    {
        "active": 0,
        "created_at": "2015-11-21 14:12:07",
        "email": "admin@seat.local",
        "id": 1,
        "last_login": "2015-11-29 08:18:28",
        "last_login_source": "::1",
        "name": "admin",
        "updated_at": "2015-11-29 08:18:28"
    },
    {
        "active": 0,
        "created_at": "2015-11-26 18:58:29",
        "email": "test@test.com",
        "id": 2,
        "last_login": "2015-11-26 18:58:29",
        "last_login_source": "::1",
        "name": "test",
        "updated_at": "2015-11-26 21:11:12"
    }
]
```

***

### Show User Detail

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/user/{identifier}` |
| Description   | Get details for a single SeAT User. Shows owned EVE API keys, Roles and Affiliations. |
| Parameters    |  **identifier** - The identifier for the user. Can be either the user_id or name. |

Sample Request:
```bash
http get http://localhost:8000/api/v1/user/test Accept:application/json X-Token:123456
```

Sample Response:
```json
{
    "active": 0,
    "affiliations": [],
    "created_at": "2015-11-26 18:58:29",
    "email": "test@test.com",
    "id": 2,
    "keys": [
        {
            "created_at": "2015-11-21 14:12:40",
            "disabled_calls": null,
            "enabled": 1,
            "key_id": 1234,
            "last_error": "221:Illegal page request! Please verify the access granted by the key you are using!",
            "updated_at": "2015-11-21 14:14:17",
            "user_id": 2,
            "v_code": "JYKyPvIv75PN58UWcRcPHrtYKb4ySThFBk3n2qN4eaYGgCr1mrJbOwvQfHqNnf5k"
        }
    ],
    "last_login": "2015-11-26 18:58:29",
    "last_login_source": "::1",
    "name": "test",
    "roles": [
        {
            "id": 2,
            "pivot": {
                "role_id": 2,
                "user_id": 2
            },
            "title": "Corp Accountant"
        }
    ],
    "updated_at": "2015-11-26 21:11:12"
}
```

***

### Add a SeAT User

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **POST** |
| Endpoint      | `/api/v1/user` |
| Description   | Adds a SeAT user. |
| Parameters    |  **username** - The username. |
|     |  **email** - The email address. |
|     |  **password** - The password for the user. |

Sample Request:
```bash
http post http://localhost:8000/api/v1/user Accept:application/json X-Token:123456 \
    username=api_user email=test@localhost.local password=blahblah
```

Sample Response:
```json
[
    "ok"
]
```

***

### Edit a User

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **PUT** |
| Endpoint      | `/api/v1/user/{identifier}` |
| Description   | Edit a SeAT User in the database. |
| Parameters    |  **identifier** - The identifier for the user. Can be either the user_id or name. |
|     |  All other fields are optional. |

Sample Request:
```bash
# changes a users password and make the user active
http put http://localhost:8000/api/v1/user/api_user Accept:application/json \
    X-Token:123456 password=blahblahr active=1
```

Sample Response:
```json
[
    "ok"
]
```

***

### Delete a User

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **DELETE** |
| Endpoint      | `/api/v1/user/{identifier}` |
| Description   | Delete a SeAT User from the database. |
| Parameters    |  **identifier** - The identifier for the user. Can be either the user_id or name. |

Sample Request:
```bash
http delete http://localhost:8000/api/v1/user/api_user Accept:application/json X-Token:123456
```

Sample Response:
```json
[
    "ok"
]
```
