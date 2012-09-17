{spawn} = require 'child_process'

binDir = './node_modules/.bin'
nodeDev = "#{binDir}/node-dev"
mocha = "#{binDir}/mocha"
npmedge = "#{binDir}/npmedge"

option '-p', '--port [PORT_NUMBER]', 'set the port number for `start`'
option '-e', '--environment [ENVIRONMENT_NAME]', 'set the environment for `start`'
task 'start', 'start the server', (options) ->
  process.env.NODE_ENV = options.environment ? 'development'
  process.env.PORT = options.port if options.port
  spawn nodeDev, ['server.js'], stdio: 'inherit'

task 'test', 'run the tests', ->
  process.env.NODE_ENV = 'test'
  args = [
    '--compilers', 'coffee:coffee-script'
    '--require', './server'
    '--require', 'should'
    '--reporter', 'list'
    '--recursive'
    './app/test'
  ]
  spawn mocha, args, stdio: 'inherit'

task 'update', 'update all packages and run npmedge', ->
  (spawn 'npm', ['install', '-q'], stdio: 'inherit').on 'exit', ->
    (spawn 'npm', ['update', '-q'], stdio: 'inherit').on 'exit', ->
      spawn npmedge, [], stdio: 'inherit'
