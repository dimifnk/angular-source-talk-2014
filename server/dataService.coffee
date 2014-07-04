_ = require "underscore"
fs = require "fs"

class Collection
  constructor: (@path) ->
  load: ->
    @content = _ JSON.parse fs.readFileSync @path
  persistCollection: ->
    toPersist = @content.value().map (doc) ->
      for field of doc
        if _.isObject(doc[field]) and doc[field].id?
          console.log "unjoining"
          doc[field] = doc[field].id
      doc
    fs.writeFileSync @path, JSON.stringify toPersist, null, 4
  save: (id, doc) ->
    if _.isObject id
      doc = id
      doc.id = Number doc.id
      persisted = doc
      persisted.id = (@content.max((d) -> d.id).id || 0) + 1
      @content.push persisted
    else
      doc.id = Number id
      persisted = @findOne id: doc.id
      _.each persisted, (val, key) -> delete persisted[key] # erase object
      _.extend persisted, doc
    @persistCollection()
    persisted
  delete: (id) ->
    id = Number id
    deleted = @findOne {id: id}
    @content = _ @content.filter (doc) ->
      doc.id != id
    @persistCollection()
    deleted
  find: (query) ->
    query.id = Number query.id if query.id?
    @content.where query
  findOne: (query) ->
    query.id = Number query.id if query.id?
    @content.findWhere query
  embed: (otherColl, field) ->
    @content.each (doc) ->
      doc[field] = otherColl.findOne {id: doc[field]}
  get: -> @content.value()

data =
  addresses: new Collection "#{__dirname}/../data/addresses.json"

# At the moment we keep everything in-memory
data.addresses.load()

_.extend module.exports, data