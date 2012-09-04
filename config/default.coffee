bootstrap = require 'die-bootstrap'

module.exports =
  staticPath: './public'

  bundles:
    '/app.css':
      main: './assets/css/app.styl'
      before: [
        bootstrap.css
          responsive: true
      ]

    '/app.js':
      main: './assets/js/app.coffee'
      before: [
        './assets/vendor/jquery-1.7.2.min.js'
        './assets/vendor/underscore-1.3.2.min.js'
        './assets/vendor/backbone-0.9.2.min.js'
        './assets/vendor/sockjs-0.3.min.js'
        bootstrap.css
          only: [
            'affix'
            'alert'
            'dropdown'
            'typeahead'
          ]
      ]
