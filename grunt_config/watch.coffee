module.exports = (options, grunt) ->

  grunt.loadNpmTasks "grunt-contrib-watch"

  paths = options.paths

  js:
    files: "#{paths.app}/scripts/**/*.js"
    tasks: ["karma:dev", "jshint", "sync:dev_js", "htmlbuild:dev"]
  tests:
    files: "tests/**/*.coffee"
    tasks: ["karma:dev"]
  less:
    files: "#{paths.app}/styles/**/*.less"
    tasks: ["sync:dev_less", "less:dev", "htmlbuild:dev"]
  index:
    files: [
      "#{paths.app}/index.html"
    ]
    tasks: ["htmlbuild:dev"]
  templates:
    files: [
      "#{paths.app}/{templates,views}/*.html"
    ]
    tasks: ["sync:dev_static"]
  grunt:
    files: ["Gruntfile.coffee"]
    tasks: ["deps", "compile_dev"]
  libs:
    files: ["grunt_config/libs.coffee"]
    tasks: ["htmlbuild:dev"]
  npm:
    files: "package.json"
    tasks: ["npm-install"]
  bower:
    files: "bower.json"
    tasks: ["bower"]
  jshint:
    files: ".jshintrc"
    tasks: ["jshint"]
  options:
    livereload: true