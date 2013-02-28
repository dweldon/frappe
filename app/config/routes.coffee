module.exports = (app) ->
  {UsersController} = app.locals
  {pathRaw} = app.locals.path

  app.get pathRaw('index'), (req, res) ->
    res.render 'index', view: 'index'

  app.get pathRaw('user.index'), UsersController.index
  app.get pathRaw('user.new'), UsersController.new
  app.post pathRaw('user.create'), UsersController.create
