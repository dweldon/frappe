module.exports = (app) ->
  users = []

  class User
    constructor: (@first = '', @last = '') ->
      @id = Math.random().toString(36).substr(2, 8)

    save: ->
      users.push @

    remove: ->
      users = users.filter (user) -> user.id isnt @id

    @all: ->
      users
