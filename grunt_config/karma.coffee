module.exports = (options, grunt) ->

  grunt.loadNpmTasks "grunt-karma"

  options:
    configFile: "karma.conf.js"
  dev: {}
  singleRun:
    singleRun: true
    autoWatch: false
    browsers: ["PhantomJS"]
  ci:
    singleRun: true
    autoWatch: false
    reporters: ["junit"]
    junitReporter:
      outputFile: "test-results.xml"
    browsers: ["PhantomJS"]