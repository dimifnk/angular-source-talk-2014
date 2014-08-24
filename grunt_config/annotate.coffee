module.exports = (options, grunt) ->

  grunt.loadNpmTasks "grunt-ng-annotate"

  paths = options.paths

  angularDemo:
    files: [
      expand: true
      src: "scripts/**/*.js"
      dest: ".tmp/annotated"
      cwd: paths.app
    ]