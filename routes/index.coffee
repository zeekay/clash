{join} = require 'path'
{readdirSync} = require 'fs'

routes = (join __dirname, f for f in readdirSync __dirname)
module.exports = (require r for r in routes when r != __filename)
