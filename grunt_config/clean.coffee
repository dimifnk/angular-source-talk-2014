module.exports = (options, grunt) ->

  grunt.loadNpmTasks "grunt-contrib-clean"

  paths = options.paths

  bower: paths.bower
  all:   paths.dist
  dev:   paths.dev