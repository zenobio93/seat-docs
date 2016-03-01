![SeAT](http://i.imgur.com/aPPOxSK.png)
## introduction
SeAT has a RESTful API. Endpoints are protected by a access token that is limited by IP address. For every IP address that wants to make API requests to SeAT, a unique token is required.  
API Tokens have no concept of ACL's. The API should primarily be used for integration with other systems.

## definitions
Currently, all API endpoints live at `<seat url>/api/<version>` where `<sear url>` is the full url to your SeAT instance and `<version>` is the API version you wish to interact with.

## authentication
Authentication to the SeAT API is done via a `X-Token` header. A token may be obtained by browsing to the API settings page in the SeAT WebUI and generating one. A sample request using `curl` with an authentication token can be seen below:

```bash
$ curl -X GET -H "X-Token:123456" -H "Accept: application/json" http://localhost:8000/api/v1/key
*   Trying ::1...
* Connected to localhost (::1) port 8000 (#0)
> GET /api/v1/key HTTP/1.1
> Host: localhost:8000
> User-Agent: curl/7.43.0
> Accept: application/json
> X-Token:123456
>
< HTTP/1.1 200 OK
< Host: localhost:8000
< Connection: close
< Cache-Control: no-cache
< Date: Sat, 28 Nov 2015 22:27:12 GMT
< Content-Type: application/json
```

## content-type
Make sure you specify the Accepted content-type header as `application/json`. When using `cURL`, you can specify it with `-H`

Example:
```bash
$ curl -X POST https://seat.testsite.local/api/v1/key -H "Accept: application/json" -H "X-Token: L3SxgdX4XUw6pVWVSCftgsh16eAbBF3D" -d "key_id=123&v_code=123"
{"v_code":["The v code must be 64 characters."]}
```

If you don't do this, the API will respond with a redirect and not give you the expected content.

## errors
All SeAT API responses will include the appropriate HTTP response codes. You should check this for error handling purposes. Some sample response codes could be:

* HTTP 200 OK - The request was successful.
* HTTP 404 Not Found - The requested endpoint could not be found.
* HTTP 422 Unprocessable Entity - Typically, input validation has failed. The response json should contain the errors.
* HTTP 500 Internal Server Error - Something bad has happened. Check the server and Laravel log files for more details.

***

## endpoints for version1 (`/api/v1`)
All methods below have the requests and responses sampled using [httpie](https://github.com/jkbrzt/httpie)

* **Eve Api Keys**
 1. [List All](#list-all-eve-api-keys)
 2. [List Single](#get-a-single-eve-api-key)
 3. [Add an EVE API Key](#add-an-eve-api-key)
 4. [Edit an EVE API Key](#edit-an-eve-api-key)
 5. [Delete an EVE API Key](#delete-an-eve-api-key)
 6. [Transfer an EVE API Key](#transfer-an-eve-api-key)

* **SeAT Users**
 1. [List All](#list-all-users)
 2. [Show Detail](#show-user-detail)
 3. [Add a User](#add-a-seat-user)
 4. [Edit a User](#edit-a-user)
 5. [Delete a User](#delete-a-user)

* **SeAT Roles**
 1. [List All](#list-all-roles)
 2. [Show Detail](#show-role-detail)

* **SeAT Access Queries**
 1. [List Available Permissions](#list-all-permissions)
 2. [User has Role](#user-has-role)
 3. [User has Permission](#user-has-permission)
 4. [Validate SeAT Credentials](#validate-seat-credentials)

* **Character Information**
 1. [Assets](#character-assets)
 2. [Bookmarks](#character-bookmarks)
 3. [Contacts](#character-contacts)
 4. [Channels](#character-channels)
 5. [Character Info](#character-info)
 6. [Industry](#character-industry)
 7. [Killmails](#character-killmails)
 8. [Market Orders](#character-market-orders)
 9. [Contracts](#character-contracts)
 10. [Character Sheet](#character-sheet)
 11. [Skills](#character-skills)
 12. [Skill In Training](#character-skill-in-training)
 13. [Skill Queue](#character-skill-queue)
 14. [Wallet Journal](#character-wallet-journal)
 15. [Wallet Transactions](#character-wallet-transactions)
 16. [Employment History](#character-employment-history)
 17. [Implants](#character-implants)
 18. [Jump Clones](#character-jump-clones)
 19. [Account Info](#character-account-info)
 20. [Mail](#character-mail)
 21. [Notifications](#character-notifications)
 22. [Planetary Interaction](#character-planetary-interaction)
 23. [Standings](#character-standings)
 24. [Research](#character-research)
 25. [Calendar Events](#character-calendar-events)

* **Corporation Information**
 1. [Assets](#corporation-assets)
 2. [Assets by Location](#corporation-assets-by-location)
 3. [Bookmarks](#corporation-bookmarks)
 4. [Contacts](#corporation-contacts)
 5. [Contracts](#corporation-contracts)
 6. [Customs Offices](#corporation-customs-offices)
 7. [Divisions](#corporation-divisions)
 8. [Industry](#corporation-industry)
 9. [Killmails](#corporation-killmails)
 10. [Market Orders](#corporation-market-orders)
 11. [Member Security](#corporation-member-security)
 12. [Member Security Logs](#corporation-member-security-logs)
 13. [Member Security Titles](#corporation-member-security-titles)
 14. [Member Tracking](#corporation-member-tracking)
 15. [Sheet](#corporation-sheet)
 16. [Standings](#corporation-standings)
 17. [Starbases](#corporation-starbases)
 18. [Wallet Divisions](#corporation-wallet-divisions)
 19. [Wallet Journal](#corporation-wallet-journal)
 20. [Wallet Transactions](#corporation-wallet-transactions)

### List all EVE API Keys
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/key`
 * Parameters: None
 * Description: *List all recorded EVE API Keys from the database.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/key Accept:application/json X-Token:123456
```
 * Sample Response:
```json
{
    "created_at": "2015-11-21 14:12:40",
    "disabled_calls": null,
    "enabled": 1,
    "key_id": 123445,
    "last_error": "221:Illegal page request! Please verify the access granted by the key you are using!",
    "updated_at": "2015-11-21 14:14:11",
    "user_id": 1,
    "v_code": "IDT1wqjWtl9QGFGHPb5Zj0kle7EnQxWDiscH64aN44qhE07oOBTfCCLFmc3uj2Hf"
}
```

### Get a single EVE API Key
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/key/{key_id}`
 * Parameters: 
  1. *key_id* - The keyID to retrieve
 * Description: *Get details for a single EVE API Key.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/key/123445 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
{
    "created_at": "2015-11-21 14:12:40",
    "disabled_calls": null,
    "enabled": 1,
    "key_id": 123445,
    "last_error": "221:Illegal page request! Please verify the access granted by the key you are using!",
    "updated_at": "2015-11-21 14:14:11",
    "user_id": 1,
    "v_code": "IDT1wqjWtl9QGFGHPb5Zj0kle7EnQxWDiscH64aN44qhE07oOBTfCCLFmc3uj2Hf"
}
```

### Add an EVE API Key
 * HTTP Verb: **POST**
 * Endpoint: `/api/v1/key`
 * Parameters: 
  1. *key_id* - The keyID to add
  2. *v_code* - The vCode to add
 * Description: *Add an EVE API key to the database*
 * Sample Request: 
```bash
http post http://localhost:8000/api/v1/key Accept:application/json X-Token:123456 key_id=123 v_code=JYKyPvIv75PN58UWcRcPHrtYKb4ySThFBk3n2qN4eaYGgCr1mrJbOwvQfHqNnf5k
```
 * Sample Response:
```json
[
    "ok"
]
```

### Edit an EVE API Key
 * HTTP Verb: **PUT**
 * Endpoint: `/api/v1/key/{key_id}`
 * Parameters: 
  1. *key_id* - The keyID to update
  2. All other values are optional to update the key
 * Description: *Edit an EVE API key in the database*
 * Sample Request: 
```bash
# sets an api key to enabled for the eveapi updater
http put http://localhost:8000/api/v1/key/1234 Accept:application/json X-Token:123456 enabled=1
```
 * Sample Response:
```json
[
    "ok"
]
```

### Delete an EVE API Key
 * HTTP Verb: **DELETE**
 * Endpoint: `/api/v1/key/{key_id}`
 * Parameters: 
  1. *key_id* - The keyID to delete
 * Description: *Delete an EVE API key from the database*
 * Sample Request: 
```bash
http delete http://localhost:8000/api/v1/key/1234 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    "ok"
]
```

### Transfer an EVE API Key
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/key/transfer/{key_id}/{user_id}`
 * Parameters: 
  1. *key_id* - The keyID to transfer
  2. *user_id* - The SeAT User id to get key ownership
 * Description: *Transfer ownership of an EVE API Key.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/key/transfer/123456/10 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    "ok"
]
```

### List all Users
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/user`
 * Parameters: None
 * Description: *List all SeAT Users from the database.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/user Accept:application/json X-Token:123456
```
 * Sample Response:
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

### Show User Detail
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/user/{identifier}`
 * Parameters: 
  1. *identifier* - The identifier for the user. Can be either the user_id or name
 * Description: *Get details for a single SeAT User. Shows owned EVE API keys, Roles and Affiliations*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/user/test Accept:application/json X-Token:123456
```
 * Sample Response:
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

### Add a SeAT User
 * HTTP Verb: **POST**
 * Endpoint: `/api/v1/user`
 * Parameters: 
  1. *username* - The username
  2. *email* - The email address
  3. *password* - The password for the user
 * Description: *Adds a SeAT user*
 * Sample Request: 
```bash
http post http://localhost:8000/api/v1/user Accept:application/json X-Token:123456 username=api_user email=test@localhost.local password=blahblah
```
 * Sample Response:
```json
[
    "ok"
]
```

### Edit a User
 * HTTP Verb: **PUT**
 * Endpoint: `/api/v1/user/{identifier}`
 * Parameters: 
  1. *identifier* - The identifier for the user. Can be either the user_id or name
  2. All other values are optional to update the key
 * Description: *Edit a SeAT User in the database*
 * Sample Request: 
```bash
# changes a users password and make the user active
http put http://localhost:8000/api/v1/user/api_user Accept:application/json X-Token:123456 password=blahblahr active=1
```
 * Sample Response:
```json
[
    "ok"
]
```

### Delete a User
 * HTTP Verb: **DELETE**
 * Endpoint: `/api/v1/user/{identifier}`
 * Parameters: 
  1. *identifier* - The identifier for the user. Can be either the user_id or name
 * Description: *Delete a SeAT User from the database*
 * Sample Request: 
```bash
http delete http://localhost:8000/api/v1/user/api_user Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    "ok"
]
```

### List all Roles
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/role`
 * Parameters: None
 * Description: *List all recorded Roles from the database.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/role Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "id": 1,
        "title": "Superuser"
    },
    {
        "id": 2,
        "title": "Corp Accountants"
    }
]
```

### Show Role Detail
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/role/{identifier}`
 * Parameters: 
  1. *identifier* - The identifier for the Role. Can be either the role_id or title
 * Description: *Get details for a single SeAT Role. Shows Users with the Role, Permissions as well as Affiliations*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/role/2 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
{
    "affiliations": [
        {
            "affiliation": 123456,
            "id": 2,
            "pivot": {
                "affiliation_id": 2,
                "role_id": 2
            },
            "type": "corp"
        }
    ],
    "id": 2,
    "permissions": [
        {
            "id": 2,
            "pivot": {
                "permission_id": 2,
                "role_id": 2
            },
            "title": "corporation.wallet_journal"
        }
    ],
    "title": "Corp Accountants",
    "users": [
        {
            "active": 0,
            "created_at": "2015-11-21 14:12:07",
            "email": "admin@seat.local",
            "id": 1,
            "last_login": "2015-11-30 03:55:44",
            "last_login_source": "::1",
            "name": "admin",
            "pivot": {
                "role_id": 2,
                "user_id": 1
            },
            "updated_at": "2015-11-30 03:55:44"
        },
        {
            "active": 0,
            "created_at": "2015-11-26 18:58:29",
            "email": "test@test.com",
            "id": 2,
            "last_login": "2015-11-26 18:58:29",
            "last_login_source": "::1",
            "name": "test",
            "pivot": {
                "role_id": 2,
                "user_id": 2
            },
            "updated_at": "2015-11-26 21:11:12"
        }
    ]
}
```

### List all Permissions
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/role/query/permissions`
 * Parameters: None
 * Description: *List all of the possible SeAT Permissions.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/role/query/permissions Accept:application/json X-Token:123456
```
 * Sample Response:
```json
{
    "0": "superuser",
    "1": "queue_manager",
    "apikey": [
        "delete",
        "detail",
        "toggle_status",
        "list",
        "update"
    ],
    "character": [
        "assets",
        "calendar",
        "contacts",
        "contracts",
        "industry",
        "killmails",
        "list",
        "mail",
        "market_orders",
        "notifications",
        "pi",
        "research_agents",
        "skills",
        "standings",
        "sheet",
        "wallet_journal",
        "wallet_transactions"
    ]
}
```

### User has Role
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/role/query/role-check/{user_identifier}/{role_identifier}`
 * Parameters:
  1. *user_identifier* - The identifier for the User. Can be either the user_id or name
  2. *role_identifier* - The identifier for the Role. Can be either the role_id or title
 * Description: *Determine if a SeAT user has a specific SeAT Role*
 * Sample Request: 
```bash
// Note the quotes around the URL. If your role names have spaces in them,
// make sure you properly url encode them before adding it to the URL itself.
http get "http://localhost:8000/api/v1/role/query/role-check/admin/Corp Accountants" Accept:application/json X-Token:123456
```
 * Sample Response:
```json
true
```

### User has Permission
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/role/query/permission-check/{user_identifier}/{permission}`
 * Parameters:
  1. *user_identifier* - The identifier for the User. Can be either the user_id or name
  2. *permission* - The identifier for the Permission. Available permissions can be found at the [permissions list](#list-all-permissions)
 * Description: *Determine if a SeAT user has a specific SeAT Permission* **NOTE** This endpoint does not honor affiliation rules!**
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/role/query/permission-check/test/corporation.assets Accept:application/json X-Token:123456
```
 * Sample Response:
```json
false
```

### Validate SeAT Credentials
 * HTTP Verb: **POST**
 * Endpoint: `/api/v1/user/auth/login`
 * Parameters: 
  1. *username* - The username
  2. *password* - The password for the user
 * Description: *Validates SeAT User Credentials*
 * Sample Request: 
```bash
http post http://localhost:8000/api/v1/user/auth/login Accept:application/json X-Token:123456 username=api_user password=blahblah
```
 * Sample Response:
```json
true
```

### Character Assets
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/assets/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters assets list.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/assets/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "anchorable": 0,
        "anchored": 0,
        "basePrice": null,
        "capacity": 115,
        "categoryID": 6,
        "characterID": 123456,
        "created_at": "2015-11-21 15:17:48",
        "description": "The Impairor-class rookie ship has been mass-produced by the Amarr Empire for decades. It is the most common spacevessel sighted within the Amarrian boundaries, and is used both as a basic trade vessel and as a small-scale slave transport. ",
        "fittableNonSingleton": 0,
        "flag": 4,
        "groupID": 237,
        "groupName": "Rookie ship",
        "iconID": 0,
        "itemID": 1012596637277,
        "locID": 61000423,
        "location": "NLO-3Z VI - NLO ne proletalo",
        "locationID": 61000423,
        "marketGroupID": 1816,
        "mass": 1148000,
        "portionSize": 1,
        "published": 1,
        "quantity": 1,
        "raceID": 4,
        "rawQuantity": -1,
        "singleton": 1,
        "soundID": 20063,
        "typeID": 596,
        "typeName": "Impairor",
        "updated_at": "2015-11-21 15:17:48",
        "useBasePrice": 0,
        "volume": 28100
    }
]
```

### Character Bookmarks
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/bookmarks/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters bookmarks.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/bookmarks/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "bookmarkID": 123456,
        "characterID": 123456,
        "created": "2012-12-28 22:22:29",
        "created_at": "2015-12-18 20:59:33",
        "creatorID": 123456,
        "folderID": 0,
        "folderName": "",
        "id": 5,
        "itemID": 0,
        "locationID": 123456,
        "mapID": 123456,
        "mapName": "Oh - Asteroid Belt 4",
        "memo": "Thing",
        "note": "",
        "typeID": 5,
        "updated_at": "2015-12-18 21:10:48",
        "x": 571196991137.98,
        "y": 26236744140.097,
        "z": -723589323955.36
    }
]
```

### Character Channels
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/channels/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters chat channels.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/channels/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "channelID": -123456,
        "characterID": 123456,
        "created_at": "2015-11-21 14:23:23",
        "info": {
            "channelID": -123456,
            "comparisonKey": "abc-chan",
            "created_at": "2015-11-21 14:23:23",
            "displayName": "ABC Chan",
            "hasPassword": 0,
            "motd": "Some MoTD",
            "ownerID": 123456,
            "ownerName": "ABC",
            "updated_at": "2015-12-18 21:41:40"
        },
        "members": [
            {
                "accessorID": 123456,
                "accessorName": "ABC",
                "channelID": -123456,
                "created_at": "2015-11-21 14:23:23",
                "id": 5,
                "reason": null,
                "role": "allowed",
                "untilWhen": null,
                "updated_at": "2015-11-21 14:23:23"
            }
        ],
        "updated_at": "2015-11-21 14:23:23"
    }
]
```

### Character Contacts
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/contacts/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters contacts list.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/contacts/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "characterID": 123456,
        "contactID": 123,
        "contactName": "Bob",
        "contactTypeID": 16159,
        "created_at": "2015-11-21 15:17:55",
        "inWatchlist": 0,
        "labelMask": 0,
        "standing": -10,
        "updated_at": "2015-11-21 15:17:55"
    }
]
```

### Character Info
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/info/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get information about the character.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/info/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
{
    "accountBalance": "9349819.63",
    "alliance": null,
    "allianceDate": null,
    "allianceID": null,
    "ancestry": "Cyber Knights",
    "ancestryID": 37,
    "bloodline": "Khanid",
    "bloodlineID": 13,
    "characterID": 123456,
    "characterName": "Bob",
    "corporation": "Bob's Corp",
    "corporationDate": "2013-08-19 13:34:00",
    "corporationID": 123456,
    "corporationName": "Bob's Corp",
    "created_at": "2015-11-21 14:14:50",
    "keyID": 1111223,
    "lastKnownLocation": "CO-7BI",
    "nextTrainingEnds": null,
    "race": "Amarr",
    "securityStatus": "0.0000000000000",
    "shipName": "Bob's Sarum Magnate",
    "shipTypeID": 29248,
    "shipTypeName": "Magnate",
    "skillPoints": 1219086,
    "updated_at": "2015-11-21 15:17:42"
}
```

### Character Industry
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/industry/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a list of the characters industry jobs.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/industry/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "activityID": 1,
        "activityName": "Manufacturing",
        "blueprintID": 1004842307489,
        "blueprintLocationID": 60013072,
        "blueprintTypeID": 2517,
        "blueprintTypeName": "Nova Rocket Blueprint",
        "characterID": 123456,
        "completedCharacterID": 0,
        "completedDate": "0001-01-01 00:00:00",
        "cost": 0,
        "created_at": "2015-11-21 14:37:35",
        "description": "Manufacturing",
        "endDate": "2012-12-06 15:42:50",
        "facilityID": 60013072,
        "facilityName": "WY-9LL VIII - Moon 3 - Dominations Testing Facilities",
        "iconNo": "18_02",
        "id": 23,
        "installerID": 123456,
        "installerName": "Bob",
        "jobID": 159368411,
        "licensedRuns": 0,
        "outputLocationID": 60013072,
        "pauseDate": "0001-01-01 00:00:00",
        "probability": 0,
        "productTypeID": 2516,
        "productTypeName": "Nova Rocket",
        "published": 1,
        "runs": 100,
        "solarSystemID": 30004621,
        "solarSystemName": "WY-9LL",
        "startDate": "2012-12-06 09:02:50",
        "stationID": 60013072,
        "status": 1,
        "successfulRuns": 0,
        "teamID": 0,
        "timeInSeconds": 24000,
        "updated_at": "2015-11-25 13:59:31"
    }
]
```

### Character Killmails
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/killmails/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a list of the characters killmails.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/killmails/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "allianceID": 123456,
        "allianceName": "Bob Alliance",
        "basePrice": null,
        "capacity": 0,
        "celestialIndex": null,
        "characterID": 123456,
        "characterName": "Bob",
        "constellationID": 20000124,
        "corporationID": 123456,
        "corporationName": "Bob's Corp",
        "created_at": "2015-11-25 14:17:51",
        "damageTaken": 464,
        "description": "Standard capsule.",
        "factionID": 0,
        "factionName": "",
        "groupID": 5,
        "iconID": 73,
        "itemID": 30000848,
        "itemName": "M-OEE8",
        "killID": 50337764,
        "killTime": "2015-11-24 17:15:10",
        "marketGroupID": null,
        "mass": 32000,
        "moonID": 0,
        "orbitID": null,
        "orbitIndex": null,
        "ownerID": 123456,
        "portionSize": 1,
        "published": 0,
        "raceID": 16,
        "radius": 4145289179056,
        "regionID": 10000010,
        "security": -0.218329,
        "shipTypeID": 670,
        "solarSystemID": null,
        "soundID": 20080,
        "typeID": 5,
        "typeName": "Capsule",
        "updated_at": "2015-11-25 14:17:51",
        "victimID": 1209964167,
        "volume": 1000,
        "x": -1.4759869943375e+17,
        "y": 7.9788702592936e+16,
        "z": 2.0063317959704e+17
    }
]
```

### Character Market Orders
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/market-orders/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a list of the characters market orders.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/market-orders/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "accountKey": 1000,
        "anchorable": 1,
        "anchored": 0,
        "basePrice": null,
        "bid": 0,
        "capacity": 0,
        "categoryID": 22,
        "charID": 123456,
        "created_at": "2015-11-21 14:56:54",
        "description": "A Medium deployable self powered unit that prevents warping within its area of effect. ",
        "duration": 90,
        "escrow": "0.00",
        "fittableNonSingleton": 0,
        "groupID": 361,
        "groupName": "Mobile Warp Disruptor",
        "iconID": 0,
        "id": 643,
        "issued": "2015-08-28 09:33:49",
        "marketGroupID": 405,
        "mass": 0,
        "minVolume": 1,
        "orderID": 4239146614,
        "orderState": 0,
        "portionSize": 1,
        "price": "6428570.71",
        "published": 1,
        "raceID": null,
        "range": 32767,
        "soundID": null,
        "stationID": 60015138,
        "stationName": "Dihra V - 24th Imperial Crusade Logistic Support",
        "typeID": 12199,
        "typeName": "Mobile Medium Warp Disruptor I",
        "updated_at": "2015-11-21 14:56:54",
        "useBasePrice": 0,
        "volEntered": 1,
        "volRemaining": 1,
        "volume": 195
    }
]
```

### Character Contracts
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/contracts/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a list of the characters contracts.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/contracts/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "acceptorID": 123456,
        "assigneeID": 123456,
        "availability": "Private",
        "buyout": "0.00",
        "characterID": 123456,
        "collateral": "0.00",
        "contractID": 98201250,
        "created_at": "2015-11-21 14:56:12",
        "dateAccepted": "2015-10-23 11:53:20",
        "dateCompleted": "2015-10-23 11:53:20",
        "dateExpired": "2015-11-06 11:52:59",
        "dateIssued": "2015-10-23 11:52:59",
        "endStationID": 61000655,
        "endlocation": "2D-0SO XI - Tax Evasion No More",
        "forCorp": 0,
        "issuerCorpID": 123456,
        "issuerID": 123456,
        "numDays": 0,
        "price": "0.00",
        "reward": "0.00",
        "startStationID": 61000655,
        "startlocation": "2D-0SO XI - Tax Evasion No More",
        "status": "Completed",
        "title": "",
        "type": "ItemExchange",
        "updated_at": "2015-11-21 14:56:12",
        "volume": 112000
    }
]
```

### Character Sheet
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/sheet/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters character sheet.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/sheet/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
{
    "DoB": "2006-11-16 05:36:00",
    "allianceID": 123456,
    "allianceName": "Bob's Alliance",
    "ancestry": "Artists",
    "ancestryID": 16,
    "balance": "101524292.93",
    "bloodLine": "Intaki",
    "bloodLineID": 8,
    "characterID": 123456,
    "charisma": 17,
    "cloneJumpDate": "2015-09-21 06:21:39",
    "cloneName": "Clone Grade Alpha",
    "cloneSkillPoints": 0,
    "cloneTypeID": 164,
    "corporationID": 123456,
    "corporationName": "Bob's Corporation",
    "created_at": "2015-11-21 14:56:03",
    "factionID": 0,
    "factionName": "",
    "freeRespecs": 0,
    "freeSkillPoints": 0,
    "gender": "Male",
    "homeStationID": 123456,
    "intelligence": 23,
    "jumpActivation": "2015-11-24 08:09:00",
    "jumpFatigue": "2015-11-24 09:00:32",
    "jumpLastUpdate": "2015-11-24 08:03:17",
    "lastRespecDate": "2012-12-13 22:50:46",
    "lastTimedRespec": "2012-12-13 22:50:46",
    "memory": 19,
    "name": "Sso",
    "perception": 23,
    "race": "Gallente",
    "remoteStationDate": "2014-12-15 08:11:21",
    "updated_at": "2015-11-25 14:17:38",
    "willpower": 17
}
```

### Character Skills
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/skills/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters skills.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/skills/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "anchorable": 0,
        "anchored": 0,
        "basePrice": "2000000.0000",
        "capacity": 0,
        "categoryID": 16,
        "characterID": 123456,
        "created_at": "2015-11-21 14:56:03",
        "description": "Grants the Wing Commander the ability to pass on their bonuses to an additional Squadron per skill level, up to a maximum of 5 Squadrons. \r\n\r\n<font color=\"0xffF67828\"><b>This skill cannot be trained on Trial Accounts.</b></font> ",
        "fittableNonSingleton": 0,
        "groupID": 258,
        "groupName": "Leadership",
        "iconID": null,
        "id": 28834,
        "level": 2,
        "marketGroupID": 370,
        "mass": 0,
        "portionSize": 1,
        "published": 1,
        "raceID": 4,
        "skillpoints": 11314,
        "soundID": null,
        "typeID": 11574,
        "typeName": "Wing Command",
        "updated_at": "2015-11-21 14:56:03",
        "useBasePrice": 1,
        "volume": 0.01
    }
]
```

### Character Skill In Training
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/skill-in-training/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a the current skill in training for a character.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/skill-in-training/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
{
    "basePrice": "4000000.0000",
    "capacity": 0,
    "characterID": 123456,
    "created_at": "2015-11-21 14:57:04",
    "currentTQTime": "2015-11-24 12:28:36",
    "description": "Skill for the operation of Electronic Attack Frigates. \r\n\r\n<font color=\"0xffF67828\"><b>This skill cannot be trained on Trial Accounts.</b></font>",
    "groupID": 257,
    "iconID": 33,
    "marketGroupID": 377,
    "mass": 0,
    "portionSize": 1,
    "published": 1,
    "raceID": null,
    "skillInTraining": 1,
    "soundID": null,
    "trainingDestinationSP": 181020,
    "trainingEndTime": "2015-11-25 15:25:33",
    "trainingStartSP": 33911,
    "trainingStartTime": "2015-11-22 16:21:32",
    "trainingToLevel": 4,
    "trainingTypeID": 28615,
    "typeID": 28615,
    "typeName": "Electronic Attack Ships",
    "updated_at": "2015-11-24 12:28:36",
    "volume": 0.01
}
```

### Character Skill Queue
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/skill-queue/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a the current queue for a character.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/skill-queue/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
   {
        "basePrice": "20000000.0000",
        "capacity": 0,
        "characterID": 123456,
        "created_at": "2015-11-24 12:28:38",
        "description": "Skill for operation of Interdictors.\r\n\r\n<font color=\"0xffF67828\"><b>This skill cannot be trained on Trial Accounts.</b></font>",
        "endSP": 1280000,
        "endTime": "2016-06-28 01:02:56",
        "groupID": 257,
        "iconID": 33,
        "level": 5,
        "marketGroupID": 377,
        "mass": 0,
        "portionSize": 1,
        "published": 1,
        "queuePosition": 11,
        "raceID": null,
        "soundID": null,
        "startSP": 226275,
        "startTime": "2016-06-06 20:00:11",
        "typeID": 12098,
        "typeName": "Interdictors",
        "updated_at": "2015-11-24 12:28:38",
        "volume": 0.01
    }
]
```

### Character Wallet Journal
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/wallet-journal/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters wallet journal. Returns the last 1000 entries*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/wallet-journal/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "amount": "10249.55",
        "argID1": 123456,
        "argName1": "YI-8ZM",
        "balance": "34081939.17",
        "characterID": 123456,
        "created_at": "2015-11-27 12:22:24",
        "date": "2015-10-13 09:54:13",
        "hash": "3e2d590ad1113863ec687bc5f22b1159",
        "owner1TypeID": 2,
        "owner2TypeID": 1378,
        "ownerID1": 123456,
        "ownerID2": 123456,
        "ownerName1": "CONCORD",
        "ownerName2": "Bob",
        "reason": "23441:1,",
        "refID": 11765665857,
        "refTypeID": 85,
        "refTypeName": "Bounty Prizes",
        "taxAmount": "0.00",
        "taxReceiverID": 0,
        "updated_at": "2015-11-27 12:22:24"
    }
]
```

### Character Wallet Transactions
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/wallet-transactions/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters wallet transactions. Returns the last 1000 entries*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/wallet-transactions/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "characterID": 123456,
        "clientID": 123456,
        "clientName": "Bob",
        "clientTypeID": 1383,
        "created_at": "2015-11-21 14:57:20",
        "hash": "c9d87c8dea4023f96e8305026340b196",
        "journalTransactionID": 11766105679,
        "price": "1249500.00",
        "quantity": 1,
        "stationID": 61000802,
        "stationName": "3V8-LJ IV - DOKDO-SUPREMACY",
        "transactionDateTime": "2015-10-13 13:49:33",
        "transactionFor": "personal",
        "transactionID": 4094239844,
        "transactionType": "buy",
        "typeID": 3244,
        "typeName": "Warp Disruptor II",
        "updated_at": "2015-11-21 14:57:20"
    }
]
```

### Character Employment History
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/employment-history/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters employment history.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/employment-history/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "characterID": 123456,
        "corporationID": 1000169,
        "corporationName": "Center for Advanced Studies",
        "created_at": "2015-11-21 14:17:39",
        "recordID": 3207893,
        "startDate": "2006-11-16 05:36:00",
        "updated_at": "2015-11-21 14:17:39"
    }
]
```

### Character Implants
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/implants/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters implants.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/implants/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "characterID": 123456,
        "created_at": "2015-11-25 14:17:38",
        "id": 7984,
        "typeID": 10221,
        "typeName": "Cybernetic Subprocessor - Standard",
        "updated_at": "2015-11-25 14:17:38"
    }
]
```

### Character Jump Clones
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/jump-clones/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters jump clones.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/jump-clones/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "basePrice": null,
        "capacity": 0,
        "characterID": 123456,
        "cloneName": "",
        "created_at": "2015-11-25 14:17:38",
        "description": "",
        "groupID": 23,
        "iconID": 34,
        "jumpCloneID": 23063005,
        "locID": 61000802,
        "location": "3V8-LJ IV - DOKDO-SUPREMACY",
        "locationID": 61000802,
        "marketGroupID": null,
        "mass": 0,
        "portionSize": 1,
        "published": 0,
        "raceID": null,
        "soundID": null,
        "typeID": 164,
        "typeName": "Clone Grade Alpha",
        "updated_at": "2015-11-25 14:17:38",
        "volume": 1
    }
]
```

### Character Account Info
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/account-info/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters account information.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/account-info/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
{
    "createDate": "2013-11-29 07:18:00",
    "created_at": "2015-11-21 14:17:37",
    "keyID": 123456,
    "logonCount": 2639,
    "logonMinutes": 242426,
    "paidUntil": "2015-12-19 12:49:41",
    "updated_at": "2015-11-25 14:17:26"
}
```

### Character Mail
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/mail/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters mail.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/mail/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "body": "Stuff",
        "characterID": 123456,
        "created_at": "2015-11-21 14:20:40",
        "id": 8115,
        "messageID": 123456,
        "senderID": 123456,
        "senderName": "Bob",
        "sentDate": "2015-10-21 06:24:00",
        "title": "Stuff",
        "toCharacterIDs": "",
        "toCorpOrAllianceID": 123456,
        "toListID": 0,
        "updated_at": "2015-11-21 14:20:40"
    }
]
```

### Character Notifications
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/notifications/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters notifications.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/notifications/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "characterID": 123456,
        "created_at": "-0001-11-30 00:00:00",
        "desc": "Mercenary Invitation Accepted",
        "id": 128,
        "notificationID": 537637998,
        "read": 0,
        "senderID": 123456,
        "senderName": "Bob",
        "sentDate": "2015-11-18 08:34:00",
        "text": "applicationText: blah",
        "typeID": 128,
        "updated_at": "-0001-11-30 00:00:00"
    }
]
```

### Character Planetary Interaction
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/pi/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters planetary colonies.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/pi/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "created_at": "2015-11-21 14:21:01",
        "lastUpdate": "2013-06-08 19:58:45",
        "numberOfPins": 4,
        "ownerID": 123456,
        "ownerName": "Bob",
        "planetID": 40318582,
        "planetName": "Ommare IX",
        "planetTypeID": 13,
        "planetTypeName": "Planet (Gas)",
        "solarSystemID": 30005027,
        "solarSystemName": "Ommare",
        "updated_at": "2015-11-21 14:21:01",
        "upgradeLevel": 3
    }
]
```

### Character Standings
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/standings/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters standings.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/standings/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "characterID": 123456,
        "created_at": "2015-11-21 14:57:08",
        "fromID": 500020,
        "fromName": "Serpentis",
        "id": 10459,
        "standing": -9.41,
        "type": "factions",
        "updated_at": "2015-11-21 14:57:08"
    }
]
```

### Character Research
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/research/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters research.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/research/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "agentID": 3013751,
        "basePrice": "10000000.0000",
        "capacity": 0,
        "characterID": 123456,
        "created_at": "2015-11-21 14:57:02",
        "description": "Skill and knowledge of Plasma physics and its use in the development of advanced technology. \r\n\r\nUsed primarily in the research of particle blaster weaponry as well as plasma based missiles and smartbombs. \r\n\r\nAllows Plasma Physics research to be performed with the help of a research agent. 1% reduction in manufacturing time for all items requiring Plasma Physics per level.\r\n\r\nNeeded for all research and manufacturing operations on related blueprints.",
        "groupID": 270,
        "iconID": 33,
        "id": 47,
        "itemID": 3013751,
        "itemName": "Charie Porelotta",
        "marketGroupID": 375,
        "mass": 0,
        "pointsPerDay": 61.25,
        "portionSize": 1,
        "published": 1,
        "raceID": 4,
        "remainderPoints": 77302.81,
        "researchStartDate": "2013-12-13 00:19:43",
        "skillTypeID": 11441,
        "soundID": null,
        "typeID": 11441,
        "typeName": "Plasma Physics",
        "updated_at": "2015-11-24 12:28:33",
        "volume": 0.01
    }
]
```

### Character Calendar Events
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/character/calendar/{character_id}`
 * Parameters: 
  1. *character_id* - The characterID for the query
 * Description: *Get a characters upcoming calendar events.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/character/calendar/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "characterID": 123456,
        "created_at": "2015-11-23 19:01:42",
        "duration": 60,
        "eventDate": "2015-11-24 17:00:00",
        "eventID": 1254322,
        "eventText": "To be tested:\r\nNew visual damage effects\r\n\r\nPlease refer to <a href=\"http://community.eveonline.com/news/news-channels/eve-online-news/check-out-the-new-visual-damage-effects-join-the-mass-test-november-24/\">this news item</a> for more info about this test.\r\n\r\nEasily connect to Singularity by using the <a href=\"https://forums.eveonline.com/default.aspx?g=posts&m=6140581\">new EVE Launcher (beta)</a>!\r\n\r\nAll participants will receive a reward of two million free skill points on Singularity.",
        "eventTitle": "Mass test on Singularity",
        "id": 377,
        "importance": 0,
        "ownerID": 1,
        "ownerName": "EVE System",
        "ownerTypeID": 0,
        "response": "Undecided",
        "updated_at": "2015-11-23 19:01:42"
    }
]
```

### Corporation Assets
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/assets/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations assets list.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/assets/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "anchorable": 0,
        "anchored": 0,
        "basePrice": null,
        "capacity": 0,
        "categoryID": 3,
        "corporationID": 123456,
        "created_at": "2015-11-24 16:31:54",
        "description": "",
        "fittableNonSingleton": 0,
        "flag": 83,
        "groupID": 16,
        "groupName": "Station Services",
        "iconID": null,
        "itemID": 228127261,
        "location": "Half VII - Moon 1 - CONCORD Bureau",
        "locationID": 66012455,
        "marketGroupID": null,
        "mass": 0,
        "portionSize": 1,
        "published": 0,
        "quantity": 1,
        "raceID": null,
        "rawQuantity": -1,
        "singleton": 1,
        "soundID": null,
        "typeID": 27,
        "typeName": "Office",
        "updated_at": "2015-11-24 16:31:54",
        "useBasePrice": 0,
        "volume": 1
    }
]
```

### Corporation Assets by Location
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/assets-by-location/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations assets list grouped by locationID. This endpoint only returns assets that are in space.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/assets-by-location/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
{
    "123456": [
        {
            "basePrice": "200000000.0000",
            "capacity": 70000,
            "corporationID": 123456,
            "created_at": "2015-12-24 10:51:58",
            "description": "The Dread Guristas Control Tower is a special enhanced version of the Caldari control tower utilizing the latest in cutting edge design techniques.\r\n\r\nRacial Bonuses:\r\n25% bonus to Missile Battery Rate of Fire\r\n50% bonus to Missile Velocity\r\n-75% bonus to Electronic Warfare Battery Target Cycling Speed",
            "flag": 0,
            "groupID": 365,
            "iconID": null,
            "itemID": 123456,
            "itemName": "Dread Guristas Control Tower Medium",
            "locationID": 123456,
            "mapID": 123456,
            "mapName": "ABC",
            "marketGroupID": 478,
            "mass": 200000000,
            "portionSize": 1,
            "published": 1,
            "quantity": 1,
            "raceID": 1,
            "rawQuantity": -1,
            "singleton": 1,
            "soundID": null,
            "typeID": 27597,
            "typeName": "Dread Guristas Control Tower Medium",
            "updated_at": "2015-12-24 10:51:58",
            "volume": 4000,
            "x": -123456,
            "y": 123456,
            "z": -123456
        },
        {
            "basePrice": "50000000.0000",
            "capacity": 20000000,
            "corporationID": 123456,
            "created_at": "2015-12-24 10:51:58",
            "description": "This structure contains equipment needed to compress various ore and ice materials for easy transportation across the universe.\r\n\r\nThis array does not have a particular restriction on security level and may be anchored in Empire sovereign space.",
            "flag": 0,
            "groupID": 1282,
            "iconID": null,
            "itemID": 123456,
            "itemName": "Compression Array",
            "locationID": 123456,
            "mapID": 123456,
            "mapName": "ABC",
            "marketGroupID": 1921,
            "mass": 50000000,
            "portionSize": 1,
            "published": 1,
            "quantity": 1,
            "raceID": null,
            "rawQuantity": -1,
            "singleton": 1,
            "soundID": null,
            "typeID": 12239,
            "typeName": "Compression Array",
            "updated_at": "2015-12-24 10:51:58",
            "volume": 6000,
            "x": -123456,
            "y": 123456,
            "z": -123456
        }
    ]
}
```

### Corporation Bookmarks
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/bookmarks/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations bookmarks.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/bookmarks/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "bookmarkID": 123456,
        "corporationID": 123456,
        "created": "2014-10-10 21:23:16",
        "created_at": "2015-12-20 14:25:03",
        "creatorID": 123456,
        "folderID": 123456,
        "folderName": "123",
        "id": 330,
        "itemID": 0,
        "locationID": 30002923,
        "mapID": 40185483,
        "mapName": "Thing",
        "memo": "A Memo",
        "note": "",
        "typeID": 5,
        "updated_at": "2015-12-20 14:25:03",
        "x": 26032436019.564,
        "y": -2848725274.3562,
        "z": 250866523571.45
    }
]
```

### Corporation Contacts
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/assets/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations contacts list.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/contacts/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "contactID": 123456,
        "contactName": "Bob",
        "contactTypeID": 2,
        "corporationID": 123456,
        "created_at": "2015-11-24 16:31:56",
        "labelMask": 0,
        "standing": -5,
        "updated_at": "2015-11-24 16:31:56"
    }
]
```

### Corporation Contracts
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/contracts/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations contracts list.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/contracts/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "acceptorID": 123456,
        "assigneeID": 123456,
        "availability": "Private",
        "buyout": "0.00",
        "collateral": "0.00",
        "contractID": 98168646,
        "corporationID": 123456,
        "created_at": "2015-11-21 14:19:05",
        "dateAccepted": "2015-10-28 22:57:33",
        "dateCompleted": "2015-10-28 22:57:33",
        "dateExpired": "2015-11-05 12:19:58",
        "dateIssued": "2015-10-22 12:19:58",
        "endStationID": 61000393,
        "endlocation": "UMI-KK VII - 2Dont relist in my Fing station",
        "forCorp": 0,
        "issuerCorpID": 123456,
        "issuerID": 123456,
        "numDays": 0,
        "price": "315000000.00",
        "reward": "0.00",
        "startStationID": 61000393,
        "startlocation": "UMI-KK VII - 2Dont relist in my Fing station",
        "status": "Completed",
        "title": "heavy missile cerb",
        "type": "ItemExchange",
        "updated_at": "2015-11-21 14:19:05",
        "volume": 92000
    }
]
```

### Corporation Contracts
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/contracts/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations contracts list.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/contracts/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "acceptorID": 123456,
        "assigneeID": 123456,
        "availability": "Private",
        "buyout": "0.00",
        "collateral": "0.00",
        "contractID": 98168646,
        "corporationID": 123456,
        "created_at": "2015-11-21 14:19:05",
        "dateAccepted": "2015-10-28 22:57:33",
        "dateCompleted": "2015-10-28 22:57:33",
        "dateExpired": "2015-11-05 12:19:58",
        "dateIssued": "2015-10-22 12:19:58",
        "endStationID": 61000393,
        "endlocation": "UMI-KK VII - 2Dont relist in my Fing station",
        "forCorp": 0,
        "issuerCorpID": 123456,
        "issuerID": 123456,
        "numDays": 0,
        "price": "315000000.00",
        "reward": "0.00",
        "startStationID": 61000393,
        "startlocation": "UMI-KK VII - 2Dont relist in my Fing station",
        "status": "Completed",
        "title": "heavy missile cerb",
        "type": "ItemExchange",
        "updated_at": "2015-11-21 14:19:05",
        "volume": 92000
    }
]
```

### Corporation Customs Offices
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/pocos/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations customs offices.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/pocos/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "allowAlliance": 0,
        "allowStandings": 0,
        "corporationID": 123456,
        "created_at": "2015-12-28 06:55:25",
        "id": 15,
        "itemID": 123456,
        "planetName": "Customs Office (ABC IV)",
        "planetTypeID": 2017,
        "planetTypeName": "Planet (Storm)",
        "reinforceHour": 0,
        "solarSystemID": 123456,
        "solarSystemName": "ABC",
        "standingLevel": -10,
        "taxRateAlliance": 0.04,
        "taxRateCorp": 0,
        "taxRateStandingBad": 0.5,
        "taxRateStandingGood": 0.06,
        "taxRateStandingHigh": 0.05,
        "taxRateStandingHorrible": 1,
        "taxRateStandingNeutral": 0.1,
        "updated_at": "2015-12-28 06:55:25"
    }
]
```

### Corporation Industry
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/industry/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations industry jobs.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/industry/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "activityID": 8,
        "activityName": "Invention",
        "blueprintID": 1019085176157,
        "blueprintLocationID": 2147483647,
        "blueprintTypeID": 31056,
        "blueprintTypeName": "Medium Trimark Armor Pump I Blueprint",
        "completedCharacterID": 0,
        "completedDate": "0001-01-01 00:00:00",
        "corporationID": 98149539,
        "cost": 28719,
        "created_at": "2015-11-22 11:20:29",
        "description": "The process of creating a more advanced item based on an existing item",
        "endDate": "2015-11-21 05:23:02",
        "facilityID": 2147483647,
        "facilityName": null,
        "iconNo": "33_02",
        "installerID": 123456,
        "installerName": "Bob",
        "jobID": 280518524,
        "licensedRuns": 60,
        "outputLocationID": 2147483647,
        "pauseDate": "0001-01-01 00:00:00",
        "probability": 1,
        "productTypeID": 31060,
        "productTypeName": "Medium Trimark Armor Pump II Blueprint",
        "published": 1,
        "runs": 3,
        "solarSystemID": 30002691,
        "solarSystemName": "Crielere",
        "startDate": "2015-11-20 23:51:32",
        "stationID": 2147483647,
        "status": 1,
        "successfulRuns": 0,
        "teamID": 0,
        "timeInSeconds": 19890,
        "updated_at": "2015-11-23 19:15:33"
    }
]
```

### Corporation Killmails
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/killmails/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations killmails.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/killmails/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "allianceID": 123456,
        "allianceName": "Bob Alliance",
        "basePrice": null,
        "capacity": 430,
        "celestialIndex": null,
        "characterID": 123456,
        "characterName": "Bob",
        "constellationID": 20000124,
        "corporationID": 123456,
        "corporationName": "Bob Corp",
        "created_at": "2015-11-27 13:54:58",
        "damageTaken": 3956,
        "description": "Released in YC 117 as the result of the first Republic Fleet joint research project to include engineers from all seven Minmatar tribes, the Svipul is a powerful symbol of inter-tribal unity for many Republic citizens.\r\n\r\nAlthough the contributions of engineers from the Nefantar and Starkmanir tribes were fairly minor, a large delegation from the Vo-Lakat Thukker caravan and donations from Republic loyalist capsuleers across the cluster were invaluable to the development of this incredibly adaptable warship.",
        "factionID": 0,
        "factionName": "",
        "groupID": 5,
        "iconID": null,
        "itemID": 30000848,
        "itemName": "M-OEE8",
        "killID": 123456,
        "killTime": "2015-11-25 11:13:53",
        "marketGroupID": 1953,
        "mass": 1500000,
        "moonID": 0,
        "orbitID": null,
        "orbitIndex": null,
        "ownerID": 123456,
        "portionSize": 1,
        "published": 1,
        "raceID": 2,
        "radius": 4145289179056,
        "regionID": 10000010,
        "security": -0.218329,
        "shipTypeID": 34562,
        "solarSystemID": null,
        "soundID": 20074,
        "typeID": 5,
        "typeName": "Svipul",
        "updated_at": "2015-11-27 13:54:58",
        "victimID": 123456,
        "volume": 47000,
        "x": -1.4759869943375e+17,
        "y": 7.9788702592936e+16,
        "z": 2.0063317959704e+17
    }
]
```

### Corporation Market Orders
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/market-orders/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations market orders.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/market-orders/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
TBA
```

### Corporation Member Security
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/member-security/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations member security roles.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/member-security/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "characterID": 123456,
        "characterName": "Bob",
        "corporationID": 123456,
        "created_at": "2015-11-27 14:01:18",
        "roleID": 1,
        "roleName": "roleDirector",
        "roleType": "grantableRolesAtOther",
        "updated_at": "2015-11-27 14:01:18"
    }
]
```

### Corporation Member Security Logs
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/member-security-logs/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations member security roles changelog.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/member-security-logs/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "changeTime": "2015-10-25 13:19:00",
        "characterID": 123456,
        "characterName": "Bob",
        "corporationID": 123456,
        "created_at": "2015-11-21 14:19:43",
        "hash": "cce3b9e3e0da5756939cf06d5ab923bd",
        "issuerID": 123456,
        "issuerName": "Bob",
        "newRoles": "[{\"8192\":\"roleHangarCanTake1\"},{\"1048576\":\"roleHangarCanQuery1\"},{\"4398046511104\":\"roleContainerCanTake1\"}]",
        "oldRoles": "[]",
        "roleLocationType": "rolesAtBase",
        "updated_at": "2015-11-21 14:19:43"
    }
]
```

### Corporation Member Security Titles
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/member-security-titles/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations member security titles assignments.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/member-security-titles/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "characterID": 123456,
        "characterName": "Bob",
        "corporationID": 123456,
        "created_at": "2015-11-27 14:01:18",
        "titleID": 16384,
        "titleName": "Member",
        "updated_at": "2015-11-27 14:01:18"
    }
]
```

### Corporation Member Tracking
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/member-tracking/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations member tracking data.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/member-tracking/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "base": "",
        "baseID": 0,
        "characterID": 123456,
        "corporationID": 123456,
        "created_at": "2015-11-21 14:19:41",
        "enabled": 1,
        "grantableRoles": "0",
        "id": 16,
        "location": "M-OEE8 XI - VOTE THE JUDGE FOR C S M XI",
        "locationID": 61000249,
        "logoffDateTime": "2015-08-09 07:16:05",
        "logonDateTime": "2015-08-09 06:56:16",
        "name": "123456",
        "roles": "1044837312573210624",
        "shipType": "Unknown Type",
        "shipTypeID": -1,
        "startDateTime": "2015-01-23 19:58:00",
        "title": "",
        "updated_at": "2015-11-21 14:19:41"
    }
]
```

### Corporation Sheet
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/sheet/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations sheet.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/sheet/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
{
    "allianceID": 123456,
    "allianceName": "Bob Alliance",
    "ceoID": 91279102,
    "ceoName": "Bob",
    "color1": 674,
    "color2": 674,
    "color3": 680,
    "corporationID": 123456,
    "corporationName": "Bob Corp",
    "created_at": "2015-11-21 14:19:14",
    "description": "",
    "factionID": 0,
    "graphicID": 0,
    "memberCount": 71,
    "memberLimit": 2300,
    "shape1": 568,
    "shape2": 576,
    "shape3": 513,
    "shares": 1000,
    "stationID": 60003754,
    "stationName": "Perimeter II - Moon 1 - Caldari Navy Assembly Plant",
    "taxRate": "0.00",
    "ticker": "BOB.",
    "updated_at": "2015-11-27 13:54:51",
    "url": ""
}
```

### Corporation Standings
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/standings/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations standings.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/standings/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "corporationID": 123456,
        "created_at": "2015-11-25 14:27:33",
        "fromID": 3018426,
        "fromName": "Poreg Murchor",
        "id": 3455,
        "standing": 2.15,
        "type": "agents",
        "updated_at": "2015-11-25 14:27:33"
    }
]
```

### Corporation Starbases
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/starbases/{corporation_id}/{starbase_id?}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
  2. *starbase_id* - An **optional** starbaseID to get details for
 * Description: *Get a corporations starbases.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/starbases/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "allowAllianceMembers": 1,
        "allowCorporationMembers": 1,
        "baseFuelUsage": 40,
        "baseStrontUsage": 400,
        "fuelBaySize": 140000,
        "fuelBlocks": 4370,
        "inSovSystem": 1,
        "itemID": 123456,
        "mapName": "ABC",
        "mapSecurity": -0.640046,
        "moonID": 123456,
        "moonName": "ABC",
        "onAggression": 0,
        "onCorporationWar": 1,
        "onlineTimeStamp": "2015-12-20 21:47:33",
        "siloCapacityBonus": null,
        "solarSystemName": "ABC",
        "starbaseCharter": 0,
        "starbaseName": "Caldari Control Tower",
        "starbaseTypeID": 16213,
        "starbaseTypeName": "Caldari Control Tower",
        "state": 4,
        "stateTimeStamp": "2015-12-24 10:47:37",
        "strontBaySize": 50000,
        "strontium": 0,
        "updated_at": "2015-12-24 10:50:54",
        "useStandingsFrom": 12345
    }
]
```

### Corporation Wallet Divisions
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/wallet-divisions/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations wallet divisions.*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/wallet-divisions/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "accountKey": 10000,
        "corporationID": 87812345623749,
        "created_at": "2015-11-21 14:19:14",
        "description": "Mercenary Wallet Division",
        "id": 8,
        "updated_at": "2015-11-21 14:19:14"
    }
]
```

### Corporation Wallet Journal
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/wallet-journal/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations wallet journal. Returns the last 1000 entries*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/wallet-journal/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "accountKey": 1000,
        "amount": "1363368.75",
        "argID1": 123456,
        "argName1": "X-CFN6",
        "balance": "1.40",
        "corporationID": 123456,
        "created_at": "2015-11-27 12:22:24",
        "date": "2015-11-17 19:28:54",
        "hash": "5cc3cf718cb50be07bd7909ad13ed62e",
        "owner1TypeID": 2,
        "owner2TypeID": 1375,
        "ownerID1": 123456,
        "ownerID2": 123456,
        "ownerName1": "Bob",
        "ownerName2": "Bob",
        "reason": "24001:2,24014:1,24015:1,24016:1,24017:1,24018:1,24095:1,24149:5,24150:6,",
        "refID": 11902387979,
        "refTypeID": 85,
        "refTypeName": "Bounty Prizes",
        "updated_at": "2015-11-27 12:22:24"
    }
]
```

### Corporation Wallet Transactions
 * HTTP Verb: **GET**
 * Endpoint: `/api/v1/corporation/wallet-transactions/{corporation_id}`
 * Parameters: 
  1. *corporation_id* - The corporationID for the query
 * Description: *Get a corporations wallet transactions. Returns the last 1000 entries*
 * Sample Request: 
```bash
http get http://localhost:8000/api/v1/corporation/wallet-transactions/123456 Accept:application/json X-Token:123456
```
 * Sample Response:
```json
[
    {
        "accountKey": 1006,
        "characterID": 123456,
        "characterName": "Bob",
        "clientID": 123456,
        "clientName": "Core Industry CRY",
        "clientTypeID": 1376,
        "corporationID": 123456,
        "created_at": "2015-11-21 14:20:13",
        "hash": "cb72c321ce34cf8a2f232849caac9a29",
        "journalTransactionID": 11799102551,
        "price": "23250000.00",
        "quantity": 1,
        "stationID": 60014890,
        "stationName": "D7-ZAC VIII - Moon 1 - D7-ZAC CO2 Stronghold",
        "transactionDateTime": "2015-10-22 10:00:25",
        "transactionFor": "corporation",
        "transactionID": 4103106946,
        "transactionType": "buy",
        "typeID": 31628,
        "typeName": "Medium Warhead Calefaction Catalyst II",
        "updated_at": "2015-11-21 14:20:13"
    }
]
```

