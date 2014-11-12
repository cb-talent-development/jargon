---
category: Localizations
path: '/api/localizations/:id'
title: 'Delete Localization'
type: 'DELETE'
oauth: 'Write Token'

layout: nil
---

Deletes a localization, removing it from the database.

### Request

* The headers must include a **valid authentication token** with a **public** scope.
* ```:id``` is the Localization ID

The only parameter that can be edited is ```Name```. Others are auto-generated and read-only.

### Response

Redirects to the [localization index](#{% post_url 2014-11-11-localizations-index %}) on success

```Status: 301 See Other```
```{
    code: 200,
    message: 'Your thing (id: 736) was deleted'
}```
