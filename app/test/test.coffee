request = require 'request'
app = require '../app'
User = app.locals.UserModel

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

describe 'User', ->
  user = null

  beforeEach ->
    user = new User

  afterEach ->
    user.remove()

  it 'should have an empty string for both first and last name', ->
    user.first.should.equal ''
    user.last.should.equal ''

  it 'should have a unique id', ->
    user.id.should.be.a 'string'
    user.id.should.have.length 8
    anotherUser = new User
    anotherUser.id.should.not.equal user.id

  it '#all should return an empty array before a save', ->
    User.all().should.eql []

  it '#save should add the user to the array of all users', ->
    user.save()
    User.all().should.have.length 1
    User.all()[0].should.eql user
