_ = require 'underscore'

levelRanking =
  debug: 0
  info: 1
  warn: 2
  error: 3

normalizeNumber = (num, digits) ->
  num = num.toString()
  while num.length < digits
    num = "0#{num}"
  num

normalizeString = (str, length) ->
  while str.length < length
    str += " "
  str

currentTime = ->
  date = new Date()
  hours = normalizeNumber date.getHours(), 2
  mins = normalizeNumber date.getMinutes(), 2
  secs = normalizeNumber date.getSeconds(), 2
  millis = normalizeNumber date.getMilliseconds(), 3
  "#{hours}:#{mins}:#{secs}:#{millis}"

log = -> console.log.apply console, _.flatten [currentTime(), arguments]

module.exports = (level) ->

  rank = levelRanking[level]

  hasLevel = (lvl) ->
    rank <= levelRanking[lvl]

  disabled = ->

  createLogger = (logName, method) ->
    if hasLevel logName
      (name) ->
        normalizedLogName = normalizeString "[#{logName}]", 7
        ->
          lineNumber = new Error().stack.match(/:([0-9]*):/g)[1].replace /:/g, ""
          normalizedName = normalizeString "#{name}:#{lineNumber} ", 20
          prefix = "#{normalizedLogName} #{normalizedName}"
          method prefix, arguments
    else -> disabled

  debugCreator = createLogger 'debug', log
  infoCreator = createLogger 'info', log
  warnCreator = createLogger 'warn', log
  errorCreator = createLogger 'error', log

  module.exports = (componentName) ->
    debug: debugCreator componentName
    info: infoCreator componentName
    warn: warnCreator componentName
    error: errorCreator componentName
    level: level
    hasLevel: hasLevel