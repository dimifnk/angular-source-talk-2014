module.exports = (options, grunt) ->

  grunt.loadNpmTasks "grunt-contrib-uglify"

  paths = options.paths

  files = {}
  files["#{paths.dist}/scripts/main.min.js"] = options.jsLibsMin.concat [
    "#{paths.app}/scripts/main.js"
    "#{paths.app}/scripts/**/*.js"
    "#{paths.dev}/scripts/templates.js"
  ]

  options:
    banner: "/*! <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today(\"yyyy-mm-dd\") %> */\n"
  dist:
    files: files