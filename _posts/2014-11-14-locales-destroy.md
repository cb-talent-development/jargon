---
category: Locales
path: '/api/localizations/:id/:locale'
title: 'Delete Locale'
type: 'DELETE'
oauth: 'Write Token'

layout: nil
---

Deletes a localization, removing it from the database.

### Request

* The headers must include a **valid authentication token** with a **write** scope.
* ```:id``` is the Localization ID
* ```:locale``` is the Locale's name.

```DELETE /api/localizations/24/Locale 6```

### Response

Redirects to the [localization index](#{% post_url 2014-11-11-localizations-index %}) on success

```Status: 200 OK```
```{
       "locales": [
           "Locale 1",
           "Locale 2",
           "Locale 3",
           "Locale 4",
           "Locale 5"
       ]
   }```
