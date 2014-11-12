---
category: Locales
path: '/api/localizations/:id/locales'
title: 'Create Locale'
type: 'POST'
oauth: 'Write Token'

layout: nil
---

Create a new Locale for a given Localization.

### Request

* The headers must include a **valid authentication token** with a **public** scope.
* ```:id``` is the Localization ID
* Parameter ```name``` is required.
* Parameter ```json``` is a json representation of the Locale.

```{
    "locale" : {
        "name": "Locale 3",
        "json": { "hello": "world" }
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
