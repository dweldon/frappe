app = require '../app'

BASE_URL = "http://localhost:#{app.get 'port'}"

{pathFor} = app.locals.path

module.exports.urlFor = urlFor = (name, params) ->
  BASE_URL + pathFor name, params
