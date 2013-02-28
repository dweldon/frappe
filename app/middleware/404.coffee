module.exports = (app) ->
  app.use (req, res, next) ->
    res.status 404
    message = 'page not found'

    switch req.accepts ['html', 'json', 'text']
      when 'html'
        res.render '404', title: '404', path: req.path, view: 'error_404'
      when 'json'
        res.send error: message
      else
        res.type('txt').send message
