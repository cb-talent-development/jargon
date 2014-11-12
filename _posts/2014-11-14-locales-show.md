---
category: Locales
path: '/api/localizations/:id/:locale'
title: 'Locales Index'
type: 'GET'
oauth: 'Public Token'

layout: nil
---

Returns a representation of a localization.

### Request

* The headers must include a **valid authentication token** with a **public** scope.
* ```:id``` is the Localization ID
* ```:locale``` is the Locale's name

```GET /api/localizations/24/Locale 6```

### Response

Returns the Locale.

```Status: 200 OK```
```{
       "locale": {
           "id": 44,
           "name": "Locale 1",
           "data": {
               "hello": "world"
           }
       }
   }```
