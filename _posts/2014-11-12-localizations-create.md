---
category: Localizations
path: '/api/localizations'
title: 'Create Localization'
type: 'POST'
oauth: 'Write Token'

layout: nil
---

Create a new localization.

### Request

* The headers must include a **valid authentication token** with a **public** scope.
* Parameter ```name``` is required.

### Response

Redirects to the new token on success, or returns validation errors on failure.

```Status: 301 See Other```
```{
    code: 200,
    message: 'Your thing (id: 736) was deleted'
}```
