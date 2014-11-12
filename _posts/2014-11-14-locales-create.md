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

* The headers must include a **valid authentication token** with a **write** scope.
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
       "locales": [
           "Locale 1",
           "Locale 2",
           "Locale 3",
           "Locale 4",
           "Locale 5",
           "Locale 6"
       ]
   }```
