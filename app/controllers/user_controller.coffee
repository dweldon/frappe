module.exports = (app) ->
  User = app.locals.UserModel

  class UserController
    @index = (req, res) ->
      res.render 'users/index', title: 'users', users: User.all()

    @create = (req, res) ->
      user = new User req.body.first, req.body.last
      user.save()
      res.redirect('/users')
