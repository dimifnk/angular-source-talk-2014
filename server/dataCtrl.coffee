data = require "./dataService"

module.exports = (app) ->
  app.get "/data/addresses", (req, res) -> res.send data.addresses
  app.get "/data/parcels", (req, res) -> res.send data.parcels