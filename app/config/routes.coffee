module.exports = (app) ->
  {UsersController} = app.locals

  app.get '/', (req, res) ->
    res.render 'index', title: 'Hello World!', view: 'index'

  app.get '/users', UsersController.index
  app.get '/users/new', UsersController.new
  app.post '/users', UsersController.create
