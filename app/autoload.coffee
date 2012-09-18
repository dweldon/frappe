fs = require 'fs'
path = require 'path'
_  = require 'underscore'
_.str = require 'underscore.string'
_.mixin _.str.exports()

module.exports = (app, dirs) ->
  # user_model.coffee => UserModel
  filenameToModulename = (filename) ->
    _(filename).chain().words('.').first().camelize().capitalize().value()

  autoload = (dir) ->
    return unless fs.existsSync dir

    for filename in fs.readdirSync(dir)
      pathname = path.join dir, filename

      if fs.lstatSync(pathname).isDirectory()
        autoload pathname
      else
        loadedModule = require(pathname)?(app)
        modulename = filenameToModulename filename
        app.locals[modulename] = loadedModule

  for dir in dirs
    autoload path.join(__dirname, dir)
