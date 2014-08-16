module.exports = (options, grunt) ->

  grunt.loadNpmTasks "grunt-karma"

  options:
    configFile: "karma.conf.js"
  dev: {}
  dist:
    reporters: ["junit"]
    junitReporter:
      outputFile: "test-results.xml"