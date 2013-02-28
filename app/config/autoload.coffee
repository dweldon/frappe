fs = require 'fs'
path = require 'path'
_  = require 'underscore'
_.str = require 'underscore.string'
_.mixin _.str.exports()

# filenameToModulename user_controller.coffee, false => UserController
# filenameToModulename title_helper.coffee, true => titleHelper
filenameToModulename = (filename, camelCase) ->
  name = _(filename).chain().words('.').first().camelize()
  if camelCase
    name.value()
  else
    name.capitalize().value()

# recursively search dir for files to require and add to app.locals
autoload = (app, dir, camelCase) ->
  return unless fs.existsSync dir

  for filename in fs.readdirSync(dir)
    pathname = path.join dir, filename

    if fs.lstatSync(pathname).isDirectory()
      autoload app, pathname, camelCase
    else
      loadedModule = require(pathname)?(app)
      modulename = filenameToModulename filename, camelCase
      app.locals[modulename] = loadedModule

module.exports = (app) ->
  (dir, camelCase = false) ->
    autoload app, dir, camelCase
