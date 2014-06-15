module.exports = (options, grunt) ->

  grunt.loadNpmTasks "grunt-express"

  dev:
    options:
      port: 6002
  dist:
    options:
      port: 6001
  options:
    showStack: true
    server: "./server.coffee"
    open: true