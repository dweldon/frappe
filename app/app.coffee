express = require 'express'
http = require 'http'
app = express()

app.configure ->
  app.set 'port', process.env.PORT or 3000
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'jade'
  app.use express.static "#{__dirname}/public"
  app.use express.favicon()
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  #app.use express.cookieParser 'your secret here'
  #app.use express.session()
  app.use app.router
  app.use require('stylus').middleware "#{__dirname}/public"

app.configure "development", ->
  app.use express.errorHandler()

app.get '/', (req, res) ->
  res.render 'index', title: 'Hello World!'

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get 'port'} in #{app.settings.env} mode"
