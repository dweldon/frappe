module.exports = (app) ->
  app.use (req, res, next) ->
    res.status 404
    message = 'page not found'

    if req.accepts 'html'
      res.render '404', title: '404', path: req.path, view: 'error_404'
    else if req.accepts 'json'
      res.send error: message
    else
      res.type('txt').send message
