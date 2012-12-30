module.exports = (app) ->
  {UserModel} = app.locals

  class UsersController
    @index = (req, res) ->
      UserModel.find {}, (err, users) ->
        res.render 'users', title: 'users', users: users, view: 'users'

    @new = (req, res) ->
      res.render 'users/new', title: 'new user', view: 'users_new'

    @create = (req, res) ->
      user = new UserModel(req.body)
      user.save (err) ->
        console.log "Error creating user" if err
        setTimeout (-> res.redirect '/users'), 1000