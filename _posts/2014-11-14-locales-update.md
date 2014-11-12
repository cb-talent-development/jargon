---
category: Locales
path: '/api/localizations/:id/:locale'
title: 'Update Locale'
type: 'PUT'
oauth: 'Write Token'

layout: nil
---

Updates a Locale.

### Request

* The headers must include a **valid authentication token** with a **write** scope.
* ```:id``` is the Localization ID
* ```:locale``` is the Locale's name.

```PUT /api/localizations/24/Locale 6```

```{
       "locale" : {
           "name": "Locale 6",
           "json": { "hello": "mom" }
       }
   }```

### Response

Redirects to the updated localization on success. Returns validation errors on failure.

```Status: 200 OK```
```{
       "locale": {
           "id": 49,
           "name": "Locale 6",
           "data": {
               "hello": "mom"
           }
       }
   }```
