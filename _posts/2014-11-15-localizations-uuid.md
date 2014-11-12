---
category: UUID
path: '/api/uuid/:uuid'
title: 'Localization by UUID'
type: 'GET'

layout: nil
---

Returns a representation of a localization.

### Request

* ```:uuid``` is the Localization's UUID

```GET /api/uuid/61267710-4286-4db9-a074-3dd5ae9993c1```

### Response

Returns the Locale.

```Status: 200 OK```
```{
       "localization": {
           "id": 23,
           "name": "Localization 1",
           "created_at": "2014-11-12T19:10:21.783Z",
           "updated_at": "2014-11-12T19:10:21.783Z",
           "available_locales": [
               "Locale 1",
               "Locale 2"
           ],
           "locales": [
               {
                   "id": 42,
                   "name": "Locale 1",
                   "data": {
                       "hello": "world"
                   }
               },
               {
                   "id": 43,
                   "name": "Locale 2",
                   "data": {
                       "hello": "no one"
                   }
               }
           ]
       }
   }```
