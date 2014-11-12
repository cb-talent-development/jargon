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

```DELETE /api/localizations/26```


### Response

Redirects to the [localization index](#{% post_url 2014-11-11-localizations-index %}) on success

```Status: 301 See Other```
```{
          "localizations": [
              {
                  "id": 23,
                  "name": "Localization 1",
                  "created_at": "2014-11-12T19:10:21.783Z",
                  "updated_at": "2014-11-12T19:10:21.783Z",
                  "available_locales": [
                      "Locale 1",
                      "Locale 2"
                  ],
                  "locales": [
                      {
                          "id": 42,
                          "name": "Locale 1",
                          "data": {
                              "hello": "world"
                          }
                      },
                      {
                          "id": 43,
                          "name": "Locale 2",
                          "data": {
                              "hello": "no one"
                          }
                      }
                  ]
              },
              {
                  "id": 24,
                  "name": "Localization 2",
                  "created_at": "2014-11-12T19:10:48.557Z",
                  "updated_at": "2014-11-12T19:10:48.557Z",
                  "available_locales": [
                      "Locale 1",
                      "Locale 2"
                  ],
                  "locales": [
                      {
                          "id": 44,
                          "name": "Locale 1",
                          "data": {
                              "hello": "world"
                          }
                      },
                      {
                          "id": 45,
                          "name": "Locale 2",
                          "data": {
                              "hello": "mom"
                          }
                      }
                  ]
              }
          ]
      }```
