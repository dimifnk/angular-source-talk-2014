app = require("express")()
bodyParser = require "body-parser"
pkg = require "./package.json"
require("./server/logger") "debug"
log = require("./server/logger") "server"

dataCtrl = require "./server/dataCtrl"

paths = pkg.paths

task = process.argv[2]

appRoutes = [
  "/"
  "/add"
  "/edit/:id"
]

basePath = if task in ["dist_server"] then "#{__dirname}/#{paths.dist}" else "#{__dirname}/#{paths.dev}"

app.use(bodyParser.json());

appRoutes.forEach (route) ->
  app.get route, (req, res) ->
    res.sendFile "#{basePath}/index.html"

# provide static assets
app.get "/assets/*", (req, res) -> res.sendFile "#{basePath}/#{req.params[0]}"

# assets only for dev
app.get "/styles/*", (req, res) -> res.sendFile "#{__dirname}/#{paths.dev}/styles/#{req.params[0]}"
app.get "/lib/*", (req, res) -> res.sendFile "#{__dirname}/#{paths.bower}/#{req.params[0]}"
app.get "/images/*", (req, res) -> res.sendFile "#{__dirname}/#{paths.dev}/images/#{req.params[0]}"

dataCtrl app

log.info "Setup complete"

module.exports = app