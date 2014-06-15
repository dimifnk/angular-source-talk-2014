_ = require "underscore"

join = (destinations, sources, field) ->
  destinations.forEach (dest) ->
    dest[field] = _.findWhere(sources, {id: dest[field]});

data =
  addresses: require "../data/addresses.json"
  parcels: require "../data/parcels.json"

join data.parcels, data.addresses, "address"

_.extend module.exports, data