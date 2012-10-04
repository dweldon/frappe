module.exports = (app) ->
  UserController = app.locals.UserController

  app.get '/', (req, res) ->
    res.render 'index', title: 'Hello World!'

  app.get '/users', UserController.index
  app.post '/users', UserController.create
