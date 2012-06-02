require 'shelljs/global'

task 'run', 'run server', (options) ->
  require './server'

task 'test', 'run tests', (options) ->
  run 'node_modules/mocha/bin/mocha --compilers coffee:coffee-script test/* -R spec -t 5000 -c'
