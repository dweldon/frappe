module.exports = (app) ->

  # TODO: Add support for process.env.MONGODB_URI overwrite.
  switch app.get('env')
    when "development"
      uri = 'mongodb://localhost/site_dev'
    when "testing"
      uri = 'mongodb://localhost/site_test'
    when "production"
      uri = 'mongodb://localhost/site_production'
    else
      console.warn "Environment #{app.get('env')} not found."

  app.locals.db_uri = uri
  app.locals.db = require('mongoose').connect app.locals.db_uri