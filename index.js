require('coffee-script');
app = require('./app');

if (!module.parent) {
  app.run();
  require('./sock');
} else {
  module.exports = app;
}
