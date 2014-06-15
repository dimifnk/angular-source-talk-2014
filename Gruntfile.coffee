module.exports = (grunt) ->

  options = require "./package.json"

  loadConfig = (module) ->
    require("./grunt_config/#{module}") options, grunt

  loadConfig "libs"
  loadConfig "npm"

  grunt.initConfig
    pkg: options
    bower:        loadConfig "bower"
    htmlbuild:    loadConfig "htmlbuild"
    less:         loadConfig "less"
    karma:        loadConfig "karma"
    uglify:       loadConfig "uglify"
    ngtemplates:  loadConfig "ngtemplates"
    watch:        loadConfig "watch"
    sync:         loadConfig "sync"
    express:      loadConfig "express"
    clean:        loadConfig "clean"

  grunt.registerTask "deps",         ["npm-install", "bower"]
  grunt.registerTask "sync_dev",     ["sync:dev_js", "sync:dev_less", "sync:dev_static", "htmlbuild:dev"]
  grunt.registerTask "compile_dev",  ["sync_dev", "less:dev", "htmlbuild:dev"]
  grunt.registerTask "compile_dist", ["sync:dist", "ngtemplates", "uglify", "less:dist", "htmlbuild:dist"]

  grunt.registerTask "dev",  ["deps", "compile_dev", "express:dev", "watch"]
  grunt.registerTask "dist", ["deps", "compile_dist"]
  grunt.registerTask "dist_server", ["deps", "compile_dist", "express:dist", "express-keepalive"]
  grunt.registerTask "ci",   ["dist", "karma:ci"]