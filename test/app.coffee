assert  = require 'assert'
app     = require '../server'
zombie  = require 'zombie'
browser = new zombie.Browser

describe 'clash', ->
  describe 'GET /', ->
    before (done) ->
      app.listen app.settings.port, ->
        browser.visit "http://localhost:#{app.settings.port}/", -> done()

    it 'has title', ->
      title = browser.text 'title'
      assert.equal title, 'clash'
