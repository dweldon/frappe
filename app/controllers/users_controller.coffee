module.exports = (app) ->
  {UserModel} = app.locals

  class UsersController
    @index = (req, res) ->
      res.render 'users', title: 'users', users: UserModel.all(), view: 'users'

    @new = (req, res) ->
      res.render 'users/new', title: 'new user', view: 'users_new'

    @create = (req, res) ->
      user = new UserModel req.body.name
      user.save()
      res.redirect('/users')
