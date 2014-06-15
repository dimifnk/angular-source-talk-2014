module.exports = (options, grunt) ->

  grunt.loadNpmTasks "grunt-contrib-jshint"

  options:
    jshintrc: ".jshintrc"
  sources: ["#{options.paths.app}/scripts/**/*.js"]
