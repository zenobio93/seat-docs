![SeAT](http://i.imgur.com/aPPOxSK.png)

# Character

All endpoints in this document are for version1 (`/api/v1`) of the SeAT API.  
All methods below have the requests and responses sampled using [httpie](https://github.com/jkbrzt/httpie).

# Available Methods
* [Assets](#character-assets)
* [Bookmarks](#character-bookmarks)
* [Contacts](#character-contacts)
* [Channels](#character-channels)
* [Character Info](#character-info)
* [Industry](#character-industry)
* [Killmails](#character-killmails)
* [Market Orders](#character-market-orders)
* [Contracts](#character-contracts)
* [Character Sheet](#character-sheet)
* [Skills](#character-skills)
* [Skill In Training](#character-skill-in-training)
* [Skill Queue](#character-skill-queue)
* [Wallet Journal](#character-wallet-journal)
* [Wallet Transactions](#character-wallet-transactions)
* [Employment History](#character-employment-history)
* [Implants](#character-implants)
* [Jump Clones](#character-jump-clones)
* [Account Info](#character-account-info)
* [Mail](#character-mail)
* [Notifications](#character-notifications)
* [Planetary Interaction](#character-planetary-interaction)
* [Standings](#character-standings)
* [Research](#character-research)
* [Calendar Events](#character-calendar-events)

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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

***

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
