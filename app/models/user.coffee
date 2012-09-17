users = []

class User
  constructor: (@first = '', @last = '') ->
    @id = Math.random().toString(36).substring 10

  save: ->
    users.push @

  remove: ->
    users = users.filter (user) -> user.id isnt @id

  @all: ->
    users

module.exports = User
