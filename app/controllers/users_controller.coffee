module.exports = (app) ->
  {UserModel} = app.locals
  {pathFor} = app.locals.path

  class UsersController
    @index = (req, res) ->
      res.render 'users', title: 'users', users: UserModel.all(), view: 'users'

    @new = (req, res) ->
      res.render 'users/new', title: 'new user', view: 'users_new'

    @create = (req, res) ->
      user = new UserModel req.body.name
      user.save()
      setTimeout (-> res.redirect pathFor 'user.index'), 1000
