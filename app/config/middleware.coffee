module.exports = (app) ->

  # 404 middleware
  app.use (req, res, next) ->
    res.status 404

    # respond with html page
    if req.accepts 'html'
      res.render '404', title: '404'
      return

    # respond with json
    if req.accepts 'json'
      res.send error: 'Not found'
      return

    # respond with plain-text
    res.type('txt').send '404 Not found'
