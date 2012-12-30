app = require '../app'

{UserModel} = app.locals
{db} = app.locals

clearDB = (done) ->
  UserModel.remove {}, ->
    done()

describe 'UserModel', ->
  before clearDB

  beforeEach (done) ->
    return done() if db.connection.db

  it "can be saved", (done) ->
    new UserModel(name: "test").save (err, user) ->
      return done(err) if err
      done()

  it 'should have a name', (done) ->
    UserModel.findOne {}, (err, user) ->
      return done(err) if err
      user.name.should.be.a 'string'
      user.name.should.eql 'test'
      done()

  it 'can be found by name', (done) ->
    UserModel.findByName 'test', (err, users) ->
      return done(err) if err
      users.should.have.lengthOf 1
      users[0].name.should.eql 'test'
      done()

  it 'should have latest five', (done) ->
    UserModel.findLatestFive (err, users) ->
      return done(err) if err
      users.length.should.eql 1
      done()

  it 'should have similar kinds', (done) ->
    UserModel.findOne {}, (err, user) ->
      return done(err) if err
      user.findSimilarKinds (err, users) ->
        return done(err) if err
        users.length.should.eql 1
        done()

  it 'should have a createdAt hook', (done) ->
    UserModel.findOne {}, (err, user) ->
      return done(err) if err
      user.createdAt.should.be.ok
      done()

  it "can be deleted", (done) ->
    UserModel.remove name: "test", (err) ->
      return done(err) if err
      UserModel.find {}, (err, user) ->
        return done(err) if err
        user.length.should.equal 0
        done()

  after clearDB