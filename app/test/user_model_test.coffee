app = require '../app'

{UserModel} = app.locals

describe 'UserModel', ->
  user = null

  beforeEach ->
    user = new UserModel

  afterEach ->
    UserModel.removeAll()

  it 'should have an empty name by default', ->
    user.name.should.equal ''

  it 'should have a unique id', ->
    user.id.should.be.a 'string'
    user.id.should.have.length 8
    anotherUser = new UserModel
    anotherUser.id.should.not.equal user.id

  it '#all should return an empty array before a save', ->
    UserModel.all().should.eql []

  it '#save should add the user to the array of all users', ->
    user.save()
    UserModel.all().should.have.length 1
    UserModel.all()[0].should.eql user
