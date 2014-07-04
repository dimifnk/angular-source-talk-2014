data = require "./dataService"

module.exports = (app) ->
  app.get "/data/addresses", (req, res) -> res.send data.addresses.get()
  app.get "/data/addresses/:id", (req, res) -> res.send data.addresses.findOne id: req.params.id
  app.post "/data/addresses", (req, res) -> res.send data.addresses.save req.body
  app.put "/data/addresses/:id", (req, res) -> res.send data.addresses.save req.params.id, req.body
  app.delete "/data/addresses/:id", (req, res) -> res.send data.addresses.delete req.params.id
