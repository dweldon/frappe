app = require '../../app'

{pathRaw, pathFor} = app.locals.path

describe 'path', ->
  describe '#pathRaw', ->
    it 'should parse all verbs', ->
      pathFor('index').should.equal '/'
      pathRaw('user.index').should.equal '/users'
      pathRaw('user.new').should.equal '/users/new'
      pathRaw('user.create').should.equal '/users'
      pathRaw('user.show').should.equal '/users/:userid'
      pathRaw('user.edit').should.equal '/users/:userid/edit'
      pathRaw('user.update').should.equal '/users/:userid'
      pathRaw('user.destroy').should.equal '/users/:userid'
      pathRaw('user.forum.index').should.equal '/users/:userid/forums'
      pathRaw('user.forum.new').should.equal '/users/:userid/forums/new'
      pathRaw('user.forum.create').should.equal '/users/:userid/forums'
      pathRaw('user.forum.show').should.equal '/users/:userid/forums/:forumid'
      pathRaw('user.forum.edit').should.equal '/users/:userid/forums/:forumid/edit'
      pathRaw('user.forum.update').should.equal '/users/:userid/forums/:forumid'
      pathRaw('user.forum.destroy').should.equal '/users/:userid/forums/:forumid'

    it 'should use token overrides', ->
      pathRaw('signup').should.equal '/signup'
      pathRaw('signup.new').should.equal '/signup/new'
      pathRaw('signup.create').should.equal '/signup'

  describe '#pathFor', ->
    it 'should parse all verbs', ->
      p1 = userid: 'u1'
      p2 = userid: 'u1', forumid: 'f1'
      pathFor('index').should.equal '/'
      pathFor('user.index').should.equal '/users'
      pathFor('user.new').should.equal '/users/new'
      pathFor('user.create').should.equal '/users'
      pathFor('user.show', p1).should.equal '/users/u1'
      pathFor('user.edit', p1).should.equal '/users/u1/edit'
      pathFor('user.update', p1).should.equal '/users/u1'
      pathFor('user.destroy', p1).should.equal '/users/u1'
      pathFor('user.forum.index', p1).should.equal '/users/u1/forums'
      pathFor('user.forum.new', p1).should.equal '/users/u1/forums/new'
      pathFor('user.forum.create', p1).should.equal '/users/u1/forums'
      pathFor('user.forum.show', p2).should.equal '/users/u1/forums/f1'
      pathFor('user.forum.edit', p2).should.equal '/users/u1/forums/f1/edit'
      pathFor('user.forum.update', p2).should.equal '/users/u1/forums/f1'
      pathFor('user.forum.destroy', p2).should.equal '/users/u1/forums/f1'

    it 'should append unused parameters', ->
      params = {userid: 'u1', x: '2', 'your email': 'test@example.org'}
      expected = '/users/u1/mice/new?x=2&your%20email=test%40example.org'
      pathFor('user.mouse.new', params).should.equal expected
