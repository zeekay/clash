module.exports =
  buildPath: './dist'
  staticPath: './public'

  cssBundle:
    entry: './assets/css/app'
    url: '/app.css'

  jsBundle:
    entry: './assets/js/app'
    url: '/app.js'
    before: [
      './assets/vendor/jquery-1.7.2.min.js'
      './assets/vendor/underscore-1.3.2.min.js'
      './assets/vendor/backbone-0.9.2.min.js'
      './assets/vendor/bootstrap-2.0.1/*.js'
      './assets/vendor/sockjs-0.3.min.js'
    ]
