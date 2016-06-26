![SeAT](http://i.imgur.com/aPPOxSK.png)

# Corporation

All endpoints in this document are for version1 (`/api/v1`) of the SeAT API.  
All methods below have the requests and responses sampled using [httpie](https://github.com/jkbrzt/httpie).

# Available Methods
* [All](#all-corporations)
* [Assets](#corporation-assets)
* [Assets by Location](#corporation-assets-by-location)
* [Assets Contents](#corporation-assets-contents)
* [Bookmarks](#corporation-bookmarks)
* [Contacts](#corporation-contacts)
* [Contracts](#corporation-contracts)
* [Customs Offices](#corporation-customs-offices)
* [Divisions](#corporation-divisions)
* [Industry](#corporation-industry)
* [Killmails](#corporation-killmails)
* [Market Orders](#corporation-market-orders)
* [Member Security](#corporation-member-security)
* [Member Security Logs](#corporation-member-security-logs)
* [Member Security Titles](#corporation-member-security-titles)
* [Member Tracking](#corporation-member-tracking)
* [Sheet](#corporation-sheet)
* [Standings](#corporation-standings)
* [Starbases](#corporation-starbases)
* [Wallet Divisions](#corporation-wallet-divisions)
* [Wallet Journal](#corporation-wallet-journal)
* [Wallet Transactions](#corporation-wallet-transactions)

***

### All Corporations

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/all` |
| Description   | Get corporations known to SeAT. |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/all Accept:application/json X-Token:123456
```

Sample Response:
```json
[
    {
        "allianceID": 0,
        "allianceName": null,
        "ceoID": 123456,
        "ceoName": "ABC",
        "color1": 683,
        "color2": 674,
        "color3": 673,
        "corporationID": 123456,
        "corporationName": "ABC Inc.",
        "created_at": "2015-11-22 11:20:24",
        "description": "Wut.",
        "factionID": 0,
        "graphicID": 0,
        "memberCount": 9,
        "memberLimit": 40,
        "shape1": 415,
        "shape2": 550,
        "shape3": 513,
        "shares": 1000,
        "stationID": 60014761,
        "stationName": "Aedald VIII - Moon 5 - Republic Military School",
        "taxRate": "0.00",
        "ticker": "ABC.",
        "updated_at": "2015-11-22 11:20:24",
        "url": ""
    }
]
```

***

### Corporation Assets

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/assets/{corporation_id}` |
| Description   | Get a corporations assets list. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/assets/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Assets by Location

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/assets-by-location/{corporation_id}` |
| Description   | Get a corporations assets list grouped by locationID. This endpoint only returns assets that are in space. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/assets-by-location/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Assets Contents

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/assets-contents/{corporation_id}/{parent_asset_id?}/{$parent_item_id?}` |
| Description   | Get a corporations assets contents. Supplying the parent_asset_id and or parent_item_id will filter the response down to only those assets. |
| Parameters    |  **corporation_id** - The corporationID for the query  |
|     |  **parent_asset_id** - (optional, required if used with parent_item_id) The parent asset ID for the query  |
|     |  **parent_item_id** - (optional) The parent item ID in the asset id for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/assets-contents/123456 Accept:application/json X-Token:123456
```

Sample Response:
```json
[
    {
        "basePrice": "1000.0000",
        "capacity": 0,
        "corporationID": 123456,
        "created_at": "2015-12-28 10:06:21",
        "description": "An unstable compound of strontium molecules encased in the crystal structure of water. When fed to a Control Tower's force field generator, these clathrates bond with the molecules already in place in the field to create a nigh-invulnerable barrier of energy. A necessary ingredient for Control Towers to go into reinforced mode.\r\n\r\nMay be obtained by reprocessing the following ice ores:\r\n\r\n<color='0xFF33FFFF'>1.0</color> security status solar system or lower:\r\n<a href=showinfo:16264>Blue Ice</a>\r\n<a href=showinfo:16262>Clear Icicle</a>\r\n<a href=showinfo:16263>Glacial Mass</a>\r\n<a href=showinfo:16265>White Glaze</a>\r\n\r\n<color='0xFFFF6600'>0.3</color> security status solar system or lower:\r\n<a href=showinfo:16266>Glare Crust</a>\r\n\r\n<color='0xFFE53300'>0.1</color> security status solar system or lower:\r\n<a href=showinfo:16267>Dark Glitter</a>\r\n\r\n<color='0xFFFF0000'>0.0</color> security status solar system or lower:\r\n<a href=showinfo:17978>Enriched Clear Icicle</a>\r\n<a href=showinfo:16268>Gelidus</a>\r\n<a href=showinfo:16269>Krystallos</a>\r\n<a href=showinfo:17976>Pristine White Glaze</a>\r\n<a href=showinfo:17977>Smooth Glacial Mass</a>\r\n<a href=showinfo:17975>Thick Blue Ice</a>",
        "flag": 122,
        "graphicID": 0,
        "groupID": 423,
        "iconID": 2696,
        "itemID": 123456,
        "marketGroupID": 1033,
        "mass": 0,
        "parentAssetItemID": 123456,
        "parentItemID": null,
        "portionSize": 1,
        "published": 1,
        "quantity": 4166,
        "raceID": null,
        "rawQuantity": 0,
        "singleton": 0,
        "soundID": null,
        "typeID": 16275,
        "typeName": "Strontium Clathrates",
        "updated_at": "2015-12-28 10:06:21",
        "volume": 3
    },
    {
        "basePrice": "95.0000",
        "capacity": 0,
        "corporationID": 123456,
        "created_at": "2015-12-28 10:06:21",
        "description": "Frustrated with the inefficiencies involved in tracking multiple fuel types, Thukker logisticians pioneered the development of prepackaged fuel. In YC 111, after a successful trial period, they converted the Tribe's entire starbase network to use fuel blocks. Capsuleers were forced to wait for this innovation while CONCORD dithered over how to handle the transition period, but were finally granted clearance in YC113.\r\n\r\nThis is a block of fuel designed for Minmatar control towers. Forty blocks are sufficient to run a standard large tower for one hour, while medium and small towers require twenty and ten blocks respectively over the same period.",
        "flag": 0,
        "graphicID": 0,
        "groupID": 1136,
        "iconID": 10836,
        "itemID": 123456,
        "marketGroupID": 1870,
        "mass": 0,
        "parentAssetItemID": 123456,
        "parentItemID": null,
        "portionSize": 40,
        "published": 1,
        "quantity": 2857,
        "raceID": null,
        "rawQuantity": 0,
        "singleton": 0,
        "soundID": null,
        "typeID": 4246,
        "typeName": "Hydrogen Fuel Block",
        "updated_at": "2015-12-28 10:06:21",
        "volume": 5
    }
]
```

***


### Corporation Bookmarks

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/bookmarks/{corporation_id}` |
| Description   | Get a corporations bookmarks. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/bookmarks/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Contacts

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/contacts/{corporation_id}` |
| Description   | Get a corporations contacts list. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/contacts/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Contracts

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/contracts/{corporation_id}` |
| Description   | Get a corporations contracts list. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/contracts/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Customs Offices

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/pocos/{corporation_id}` |
| Description   | Get a corporations customs offices. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/pocos/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Industry

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/industry/{corporation_id}` |
| Description   | Get a corporations industry jobs. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/industry/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Killmails

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/killmails/{corporation_id}` |
| Description   | Get a corporations killmails. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/killmails/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Market Orders

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/market-orders/{corporation_id}` |
| Description   | Get a corporations market orders. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/market-orders/123456 Accept:application/json X-Token:123456
```

Sample Response:
```json
TBA
```

***

### Corporation Member Security

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/member-security/{corporation_id}` |
| Description   | Get a corporations member security roles. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/member-security/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Member Security Logs

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/member-security-logs/{corporation_id}` |
| Description   | Get a corporations member security roles change log. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/member-security-logs/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Member Security Titles

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/member-security-titles/{corporation_id}` |
| Description   | Get a corporations member security titles assignments. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/member-security-titles/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Member Tracking

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/member-tracking/{corporation_id}` |
| Description   | Get a corporations member tracking data. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/member-tracking/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Sheet

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/sheet/{corporation_id}` |
| Description   | Get a corporations sheet. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/sheet/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Standings

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/standings/{corporation_id}` |
| Description   | Get a corporations standings. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/standings/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Starbases

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/starbases/{corporation_id}/{starbase_id?}` |
| Description   | Get a corporations starbases. If a starbaseID is set, mode details such as silo levels is also returned. |
| Parameters    |  **corporation_id** - The corporationID for the query  |
|     |  **starbase_id** - An *optional* starbaseID to get details for  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/starbases/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Wallet Divisions

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/wallet-divisions/{corporation_id}` |
| Description   | Get a corporations wallet divisions. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/wallet-divisions/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Wallet Journal

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/wallet-journal/{corporation_id}` |
| Description   | Get a corporations wallet journal. Returns the last 1000 entries. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/wallet-journal/123456 Accept:application/json X-Token:123456
```

Sample Response:
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

***

### Corporation Wallet Transactions

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/corporation/wallet-transactions/{corporation_id}` |
| Description   | Get a corporations wallet transactions. Returns the last 1000 entries. |
| Parameters    |  **corporation_id** - The corporationID for the query  |

Sample Request:
```bash
http get http://localhost:8000/api/v1/corporation/wallet-transactions/123456 Accept:application/json X-Token:123456
```

Sample Response:
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
