#!/usr/bin/env node
require('coffee-script');

app = require('./app');

app.__run = app.run;
app.run = function(){
  app.__run();
  require('./sock');
};

if (!module.parent) {
  app.run();
} else {
  module.exports = app;
}
