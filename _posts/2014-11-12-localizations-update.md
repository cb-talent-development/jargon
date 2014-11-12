---
category: Localizations
path: '/api/localizations/:id'
title: 'Update Localization'
type: 'PUT'
oauth: 'Write Token'

layout: nil
---

Updates a localization, allowing you to change its name.

### Request

* The headers must include a **valid authentication token** with a **public** scope.
* ```:id``` is the Localization ID

The only parameter that can be edited is ```Name```. Others are auto-generated and read-only.

### Response

Redirects to the updated localization on success. Returns validation errors on failure.

```Status: 301 See Other```
```{
    code: 200,
    message: 'Your thing (id: 736) was deleted'
}```
