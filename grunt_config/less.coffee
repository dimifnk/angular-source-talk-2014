module.exports = (options, grunt) ->

  grunt.loadNpmTasks "grunt-contrib-less"

  paths = options.paths

  dev_files = {}
  dev_files["#{paths.dev}/styles/main.css"] = "#{paths.dev}/styles/main.less"
  dist_files = {}
  dist_files["#{paths.dist}/styles/main.min.css"] = "#{paths.app}/styles/main.less"

  dev:
    files: dev_files
    options:
      sourceMap: true
      sourceMapBasepath: paths.dev
      sourceMapRootpath: "/"
  dist:
    files: dist_files
    options:
      cleancss: true
  options:
    paths: [paths.bower, "#{paths.dev}/styles"]
    ieCompat: false
    relativeUrls: true