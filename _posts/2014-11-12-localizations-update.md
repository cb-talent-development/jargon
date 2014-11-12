---
category: Localizations
path: '/api/localizations/:id'
title: 'Update Localization'
type: 'PUT'
oauth: 'Write Token'

layout: nil
---

Updates a localization, allowing you to change its name.

### Request

* The headers must include a **valid authentication token** with a **public** scope.
* ```:id``` is the Localization ID

The only parameter that can be edited is **name**. Others are auto-generated and read-only.

```{
    "localization" : {
        "name": "Localization 2 Renamed"
    }
}```

### Response

Redirects to the updated localization on success. Returns validation errors on failure.

```Status: 301 See Other```
```{
       "localization": {
           "id": 24,
           "name": "Localization 2 Renamed",
           "created_at": "2014-11-12T19:10:48.557Z",
           "updated_at": "2014-11-12T19:28:08.071Z",
           "available_locales": [
               "Locale 1",
               "Locale 2"
           ],
           "locales": [
               {
                   "id": 44,
                   "name": "Locale 1",
                   "data": {
                       "hello": "world"
                   }
               },
               {
                   "id": 45,
                   "name": "Locale 2",
                   "data": {
                       "hello": "mom"
                   }
               }
           ]
       }
   }```
