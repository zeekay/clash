assert  = require 'assert'
app     = require '../server'
zombie  = require 'zombie'
browser = new zombie.Browser

app.run()

describe 'clash', ->
  describe 'GET /', ->
    before (done) ->
      url = "http://localhost:#{app.address().port}/"
      console.log url
      browser.visit url, -> done()

    it 'has title', ->
      title = browser.text 'title'
      assert.equal title, "clash - it's like fight club for hackers"
