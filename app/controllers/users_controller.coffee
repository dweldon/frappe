module.exports = (app) ->
  {UserModel} = app.locals

  class UsersController
    @index = (req, res) ->
      res.render 'users', title: 'users', users: UserModel.all()

    @new = (req, res) ->
      res.render 'users/new', title: 'new user'

    @create = (req, res) ->
      user = new UserModel req.body.name
      user.save()
      res.redirect('/users')
