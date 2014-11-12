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
    code: 200,
    message: 'Your thing (id: 736) was deleted'
}```
