require 'shelljs/global'

task 'run', 'run clash', (options) ->
  require './server'

task 'test', 'test clash', (options) ->
  exec 'node_modules/mocha/bin/mocha --compilers coffee:coffee-script test/* -R spec -t 5000 -c'
