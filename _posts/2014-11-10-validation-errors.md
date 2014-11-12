---
title: 'Errors'

layout: nil
---

## Authorization Errors

Authorization errors will be returned as an **Status 401 Unauthorized** in the following cases:

* No OAuth Token is provided
* An expired OAuth token is provided
* An OAuth token with the wrong scopes is provided

## Validation Errors

Validation errors will be returned as an object with a list of validation errors in plain language.

```{
    "localizations": [
        "Name has already been taken"
    ]
}
```
