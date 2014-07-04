_ = require "underscore"

module.exports = (options) ->

  bower = options.paths.bower

  # Add your JS dependencies here (source : minified)
  mapping = [
    "#{bower}/angular/angular.js : #{bower}/angular/angular.min.js"
    "#{bower}/angular-resource/angular-resource.js : #{bower}/angular-resource/angular-resource.min.js"
    "#{bower}/angular-route/angular-route.js : #{bower}/angular-route/angular-route.min.js"
    "#{bower}/underscore/underscore.js : #{bower}/underscore/underscore.js"
  ]

  staticLibs = [
    {cwd: "#{bower}/bootstrap", src: "fonts/*"}
  ]

  options.jsLibs = mapping.map (lib) -> lib.replace /\s*:.*/, ""
  options.jsLibsMin = mapping.map (lib) -> lib.replace /.*:\s*/, ""
  options.staticLibs = staticLibs.map (lib) -> _.extend lib, {expand: true}