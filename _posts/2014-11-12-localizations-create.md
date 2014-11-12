---
category: Localizations
path: '/api/localizations'
title: 'Create Localization'
type: 'POST'
oauth: 'Write Token'

layout: nil
---

Create a new localization.

### Request

* The headers must include a **valid authentication token** with a **public** scope.
* Parameter ```name``` is required.

```POST /api/localizations```

```{
    "localization" : {
        "name": "Localization 3"
    }
}```

### Response

Redirects to the new token on success, or returns validation errors on failure.

```Status: 200 OK```
```{
       "localization": {
           "id": 26,
           "name": "Localization 3",
           "created_at": "2014-11-12T19:29:57.829Z",
           "updated_at": "2014-11-12T19:29:57.829Z",
           "available_locales": [],
           "locales": []
       }
   }```
