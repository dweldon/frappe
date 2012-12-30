module.exports = (app) ->
  {db} = app.locals

  # The following User model demonstrates some mongoose features.
  # For the full documentation see http://mongoosejs.com/docs/api.html

  UserSchema = new db.Schema
    name: String
    kind:
      type: String
      default: "visitor"
    createdAt:
      type: Date
      expires: "24h"

  .method
    findSimilarKinds: (cb) ->
      @model('User').find
        kind: @kind
      , cb

  .static
    findByName: (name, cb) ->
      @find
        name: new RegExp(name, "i")
      , cb
    removeAll: (err) ->
      @remove {}, err
    findLatestFive: (cb) ->
      @find({})
       .sort(createdAt: -1)
       .limit(5)
       .exec(cb)

  .pre "save", (next) ->
    @createdAt = new Date() # Now
    next()

  db.model 'User', UserSchema

