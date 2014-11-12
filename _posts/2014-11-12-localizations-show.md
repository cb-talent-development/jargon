---
category: Localizations
path: '/api/localizations/:id'
title: 'Show Localization'
type: 'GET'
oauth: 'Public Token'

layout: nil
---

Returns a representation of a localization.

### Request

* The headers must include a **valid authentication token** with a **public** scope.
* ```:id``` is the Localization ID

### Response

Returns the localization.

```Status: 200 OK```
```{
       "localization": {
           "id": 24,
           "name": "Localization 2",
           "created_at": "2014-11-12T19:10:48.557Z",
           "updated_at": "2014-11-12T19:10:48.557Z",
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
