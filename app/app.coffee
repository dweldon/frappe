express = require 'express'
http = require 'http'
app = express()

PORT = 8000
PORT_TEST = PORT + 1

app.configure ->
  app.set 'port', process.env.PORT or PORT
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger('dev') if app.get('env') is 'development'
  app.use express.bodyParser()
  app.use express.methodOverride()
  #app.use express.cookieParser 'your secret here'
  #app.use express.session()
  app.use app.router
  app.use require('connect-assets')(
    helperContext: app.locals
    src: "#{__dirname}/assets"
  )
  app.use express.static "#{__dirname}/public"
  require('./middleware/404')(app)

app.configure 'development', ->
  app.use express.errorHandler()
  app.locals.pretty = true

app.configure "test", ->
  app.set 'port', PORT_TEST

autoload = require('./config/autoload')(app)
autoload "#{__dirname}/helpers", true
autoload "#{__dirname}/assets/js/shared", true
autoload "#{__dirname}/models"
autoload "#{__dirname}/controllers"

require('./config/routes')(app)

http.createServer(app).listen app.get('port'), ->
  port = app.get 'port'
  env = app.settings.env
  console.log "listening on port #{port} in #{env} mode"

module.exports = app
