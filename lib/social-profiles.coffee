module.exports =
  enabled: true
  resource:
    nested: true
    scopes: [
      "admin"
      "user"
    ]
    routes: [
      {
        path: "/"
        methods: [
          "get"
        ]
      }
      {
        path: "/"
        methods: [
          "put"
          "post"
          "delete"
        ]
        scopes: [
          "admin"
        ]
      }
    ]
  database:
    model:
      primaryKeys: [
        "email"
      ]
      indexes:
        idx_1:
          columns: "email, password"
      validation:
        validatesPresenceOf: [
          "email"
          "password"
        ]
        validatesUniquenessOf:
          email:
            message: "EMAIL_UNIQUENESS"
          username:
            message: "USERNAME_UNIQUENESS"
      schema:
        accountId:
          type: "String"
          limit: 255
          index: true
        socialProfileData:
          type: "Json"
      relationships:
        belongsTo:
          accounts:
            as: "account"
            foreignKey: "accountId"
