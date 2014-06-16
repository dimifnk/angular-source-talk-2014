data = require "./dataService"

module.exports = (app) ->
  app.get "/data/addresses", (req, res) -> res.send data.addresses.get()
  app.get "/data/addresses/:id", (req, res) -> res.send data.addresses.findOne id: req.params.id
  app.post "/data/addresses", (req, res) -> res.send data.addresses.save req.body
  app.put "/data/addresses/:id", (req, res) -> res.send data.addresses.save req.params.id, req.body
  app.delete "/data/addresses/:id", (req, res) -> res.send data.addresses.delete req.params.id

  app.get "/data/parcels", (req, res) -> res.send data.parcels.get()
  app.get "/data/parcels/:id", (req, res) -> res.send data.parcels.findOne id: req.params.id
  app.post "/data/parcels", (req, res) -> res.send data.parcels.save req.body
  app.put "/data/parcels/:id", (req, res) -> res.send data.parcels.save req.params.id, req.body
  app.delete "/data/parcels/:id", (req, res) -> res.send data.parcels.delete req.params.id