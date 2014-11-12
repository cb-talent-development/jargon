---
category: Locales
path: '/api/localizations/:id/locales'
title: 'Locales Index'
type: 'GET'
oauth: 'Public Token'

layout: nil
---

Returns a list of all Locales for a given Localization.

### Request

* The headers must include a **valid authentication token** with a **public** scope.
* ```:id``` is the Localization ID

```GET /api/localizations/24/locales```

### Response

Returns a list of all Locales for a given Localization.

```Status: 200 OK```
```{
       "locales": [
           "Locale 1",
           "Locale 2"
       ]
   }```
