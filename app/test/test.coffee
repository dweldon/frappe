request = require 'request'
app = require '../app'

PORT = app.get 'port'
BASE_URL = "http://localhost:#{PORT}"

describe 'server', ->
  body = null

  describe 'index', ->
    before (done) ->
      request BASE_URL, (err, res, _body) ->
        body = _body
        done()

    it 'should have the proper title', ->
      body.should.match /<title>Hello World!<\/title>/

    it 'should say it is in test mode', ->
      body.should.match /in test mode!/

  describe '404', ->
    it 'should reply with a 404 status code', (done) ->
      request "#{BASE_URL}/404", (err, res, body) ->
        res.should.have.status 404
        done()
