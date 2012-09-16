{spawn} = require 'child_process'

option '-p', '--port [PORT_NUMBER]', 'set the port number for `start`'
option '-e', '--environment [ENVIRONMENT_NAME]', 'set the environment for `start`'
task 'start', 'start the server', (options) ->
  process.env.NODE_ENV = options.environment ? 'development'
  process.env.PORT = options.port ? 8000
  command = './node_modules/node-dev/node-dev'
  server = spawn command, ['server.js'], stdio: 'inherit'
