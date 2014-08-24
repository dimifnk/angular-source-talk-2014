module.exports = (grunt) ->

  options = require "./package.json"

  loadConfig = (module) ->
    require("./grunt_config/#{module}") options, grunt

  loadConfig "libs"
  loadConfig "npm"

  grunt.initConfig
    pkg: options
    bower:        loadConfig "bower"
    jshint:       loadConfig "jshint"
    htmlbuild:    loadConfig "htmlbuild"
    less:         loadConfig "less"
    karma:        loadConfig "karma"
    uglify:       loadConfig "uglify"
    ngtemplates:  loadConfig "ngtemplates"
    ngAnnotate:   loadConfig "annotate"
    watch:        loadConfig "watch"
    sync:         loadConfig "sync"
    express:      loadConfig "express"
    clean:        loadConfig "clean"

  grunt.registerTask "deps",         ["npm-install", "bower"]
  grunt.registerTask "sync_dev",     ["sync:dev_js", "sync:dev_less", "sync:dev_static", "htmlbuild:dev"]
  grunt.registerTask "compile_dev",  ["sync_dev", "less:dev", "htmlbuild:dev"]
  grunt.registerTask "compile_dist", ["sync:dist", "ngtemplates", "ngAnnotate", "uglify", "less:dist", "htmlbuild:dist"]

  grunt.registerTask "dev",  ["deps", "jshint", "karma:dev", "compile_dev", "express:dev", "watch"]
  grunt.registerTask "dist", ["deps", "jshint", "karma:dist", "compile_dist"]
  grunt.registerTask "dist_server", ["dist", "express:dist", "express-keepalive"]
  grunt.registerTask "ci",   ["dist"]