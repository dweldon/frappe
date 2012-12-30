module.exports = (app) ->

  # TODO: Add support for process.env.MONGODB_URI overwrite.
  switch app.get('env')
    when "development"
      uri = 'mongodb://localhost/site_dev'
    when "test"
      uri = 'mongodb://localhost/site_test'
    when "production"
      uri = 'mongodb://localhost/site_production'
    else
      console.warn "Environment #{app.get('env')} not found."

  app.locals.db = mongoose = require 'mongoose'
  mongoose.connect app.locals.db_uri = uri