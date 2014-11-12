---
title: 'Errors'

layout: nil
---

## Authorization Errors

Authorization errors will be returned as an ```HTTP 401 Unauthorized``` in the following cases:

* No OAuth Token is provided
* An expired OAuth token is provided
* An OAuth token with the wrong scopes is provided

## Validation Errors

Validation errors will be returned as a JSON array containing plain text strings.
