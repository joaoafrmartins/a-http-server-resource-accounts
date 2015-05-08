module.exports =
  "accounts":
    "enabled": true
    "resource":
      "scopes": [
        "admin"
        "user"
      ]
      "routes": [
        {
          "path": "/"
          "methods": [
            "get"
          ]
        }
        {
          "path": "/"
          "methods": [
            "put"
            "post"
            "delete"
          ]
          "scopes": [
            "admin"
          ]
        }
      ]
    "database":
      "model":
        "primaryKeys": [
          "email"
        ]
        "indexes":
          "idx_1":
            "columns": "accountId"
          "idx_2":
            "columns": "email, password"
        "validation":
          "validatesPresenceOf": [
            "email"
            "password"
          ]
          "validatesUniquenessOf":
            "email":
              "message": "EMAIL_UNIQUENESS"
            "username":
              "message": "USERNAME_UNIQUENESS"
        "schema":
          "accountId":
            "type": "String"
            "limit": 255
            "index": true
          "email":
            "type": "String"
            "limit": 255
            "index": true
          "password":
            "type": "String"
            "limit": 16
            "index": true
          "verified":
            "type": "Boolean"
        "relationships":
          "hasMany":
            "social-profiles":
              "as": "socialProfiles"
              "foreignKey": "accountId"

  "social-profiles": require './social-profiles'
