module.exports = (program) ->
  program
    .command('run-sockjs')
    .description('  run sockjs server')
    .action ->
      console.log 'hi'
