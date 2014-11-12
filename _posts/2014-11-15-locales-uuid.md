---
category: UUID
path: '/api/uuid/:uuid/:locale'
title: 'Locale by UUID'
type: 'GET'

layout: nil
---

Returns a representation of a localization.

### Request

* ```:uuid``` is the Localization's UUID
* ```:locale``` is the Locale's name

```GET /api/uuid/61267710-4286-4db9-a074-3dd5ae9993c1/Locale 1```

### Response

Returns the Locale.

```Status: 200 OK```
```{
       "locale": {
           "id": 42,
           "name": "Locale 1",
           "data": {
               "hello": "world"
           }
       }
   }```
