request = require 'superagent'
app = require '../app'

PORT = app.get 'port'
BASE_URL = "http://localhost:#{PORT}"

describe '404', ->
  url = "#{BASE_URL}/404"
  message = 'page not found'

  it 'should respond with html (accepts html)', (done) ->
    request.get(url).end (res) ->
      res.should.have.status 404
      res.should.be.html
      done()

  it 'should respond with json (accepts json)', (done) ->
    request.get(url).set('Accept', 'application/json').end (res) ->
      res.should.have.status 404
      res.should.be.json
      res.body.should.eql error: message
      done()

  it 'should respond with text (accepts text)', (done) ->
    request.get(url).set('Accept', 'text/plain').end (res) ->
      res.should.have.status 404
      res.text.should.equal message
      done()
