request = require 'request'
app = require '../app'

PORT = app.get 'port'
BASE_URL = "http://localhost:#{PORT}"

describe '404', ->
  url = "#{BASE_URL}/404"
  message = 'page not found' 

  it 'should respond with html with default headers', (done) ->
    request url, (err, res, body) ->
      res.should.have.status 404
      res.should.be.html
      done()

  it 'should respond with json with json headers', (done) ->
    options = {uri: url, headers: {'accept': 'application/json'}}
    request options, (err, res, body) ->
      res.should.have.status 404
      res.should.be.json
      (JSON.parse body).error.should.equal message
      done()

  it 'should respond with text with text headers', (done) ->
    options = {uri: url, headers: {'accept': 'text'}}
    request options, (err, res, body) ->
      res.should.have.status 404
      body.should.equal message
      done()
