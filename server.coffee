app = require("express")()
bodyParser = require "body-parser"
pkg = require "./package.json"

dataCtrl = require "./server/dataCtrl"

paths = pkg.paths

task = process.argv[2]

appRoutes = [
  "/"
  "/addresses"
  "/parcels"
  "/send-parcel"
]

basePath = if task in ["dist_server"] then paths.dist else paths.dev

app.use(bodyParser.json());

appRoutes.forEach (route) ->
  app.get route, (req, res) ->
    res.sendfile "#{basePath}/index.html"

# provide static assets
app.get "/assets/*", (req, res) -> res.sendfile "#{basePath}/#{req.params[0]}"

# assets only for dev
app.get "/styles/*", (req, res) -> res.sendfile "#{paths.dev}/styles/#{req.params[0]}"
app.get "/lib/*", (req, res) -> res.sendfile "#{paths.bower}/#{req.params[0]}"

dataCtrl app

module.exports = app