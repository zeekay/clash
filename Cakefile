require 'shelljs/global'

task 'run', 'run clash', (options) ->
  app = require './server'
  sock = require './sock'
  app.run()

task 'test', 'test clash', (options) ->
  exec 'node_modules/mocha/bin/mocha --compilers coffee:coffee-script test/* -R spec -t 5000 -c'

task 'build', 'build clash', (options) ->
  exec 'node_modules/hemlock/bin/hemlock build'
