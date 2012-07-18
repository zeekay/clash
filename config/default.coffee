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
      './assets/vendor/bootstrap-2.0.1/alert.min.js'
      './assets/vendor/bootstrap-2.0.1/button.min.js'
      './assets/vendor/bootstrap-2.0.1/carousel.min.js'
      './assets/vendor/bootstrap-2.0.1/collapse.min.js'
      './assets/vendor/bootstrap-2.0.1/dropdown.min.js'
      './assets/vendor/bootstrap-2.0.1/modal.min.js'
      './assets/vendor/bootstrap-2.0.1/scrollspy.min.js'
      './assets/vendor/bootstrap-2.0.1/tab.min.js'
      './assets/vendor/bootstrap-2.0.1/tooltip.min.js'
      './assets/vendor/bootstrap-2.0.1/transition.min.js'
      './assets/vendor/bootstrap-2.0.1/typeahead.min.js'
      './assets/vendor/sockjs-0.3.min.js'
    ]
