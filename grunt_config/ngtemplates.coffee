module.exports = (options, grunt) ->

  grunt.loadNpmTasks "grunt-angular-templates"

  paths = options.paths

  angularDemo:
    src: "{views,templates}/**/*.html"
    dest: "#{paths.dev}/scripts/templates.js"
    cwd: paths.app
    options:
      prefix: "/assets/"