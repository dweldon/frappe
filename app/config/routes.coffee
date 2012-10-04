module.exports = (app) ->
  {UsersController} = app.locals

  app.get '/', (req, res) ->
    res.render 'index', view: 'index'

  app.get '/users', UsersController.index
  app.get '/users/new', UsersController.new
  app.post '/users', UsersController.create
