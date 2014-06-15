module.exports = (options, grunt) ->

  grunt.loadNpmTasks "grunt-bower-task"

  install:
    options:
      copy: false