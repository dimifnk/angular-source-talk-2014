grunt = require "grunt"
log = require("./logger") "dataCtrl"
_ = require "underscore"

module.exports = (app) ->

  json = JSON.stringify

  mocks = grunt.file.expand("data/**/*.json").map (mock) -> mock.replace /\.json/, ""

  mocks.forEach (collectionName) ->
    log.debug "Adding collection #{collectionName}."
    collection = require "../#{collectionName}.json"
    app.get "/#{collectionName}/:id?", (req, res) ->
      log.debug "GET    #{collectionName} called. params: #{json req.params}"
      res.send if req.params.id? then collection[req.params.id - 1] else _.compact collection
    app.post "/#{collectionName}", (req, res) ->
      log.debug "POST   #{collectionName} called. data: #{json req.data}"
      req.body.id = collection.length + 1
      collection.push req.body
      res.send req.body
    app.put "/#{collectionName}/:id", (req, res) ->
      log.debug "PUT    #{collectionName} called. params: #{json req.params}, data: #{json req.data}"
      collection[req.params.id - 1] = req.body
      res.send req.body
    app.delete "/#{collectionName}/:id", (req, res) ->
      log.debug "DELETE #{collectionName} called. params: #{json req.params}"
      delete collection[req.params.id - 1]
      res.send req.body