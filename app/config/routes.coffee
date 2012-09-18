module.exports = (app) ->
  UserController = app.locals.UserController

  app.get '/', (req, res) ->
    res.render 'index', title: 'Hello World!'

  app.namespace '/users', ->
    app.get '/', UserController.index
    app.post '/', UserController.create
