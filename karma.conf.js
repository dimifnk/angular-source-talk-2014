module.exports = function (config) {

    'use strict';

    config.set({

        frameworks: ['jasmine'],

        // list of files / patterns to load in the browser
        files: [
            '.tmp/lib/underscore/underscore.js',
            '.tmp/lib/angular/angular.js',
            '.tmp/lib/angular-resource/angular-resource.js',
            '.tmp/lib/angular-mocks/angular-mocks.js',
            '.tmp/lib/angular-route/angular-route.js',
            'app/scripts/main.js',
            'app/scripts/**/*.js',
            'tests/app/mocks/**/*.coffee',
            'tests/app/**/*.coffee'
        ],

        // list of files to exclude
        //exclude: ['app/scripts/route.js'],

        // use dots reporter, as travis terminal does not support escaping sequences
        // possible values: 'dots', 'progress'
        // CLI --reporters progress
        reporters: [
            'progress'
//        'junit'
        ],

//    junitReporter: {
//      // will be resolved to basePath (in the same way as files/exclude patterns)
//      outputFile: 'test-results.xml'
//    },

        // web server port
        // CLI --port 8877
        port: 8877,

        // enable / disable colors in the output (reporters and logs)
        // CLI --colors --no-colors
        colors: true,

        // level of logging
        // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
        // CLI --log-level debug
        logLevel: config.LOG_INFO,

        // enable / disable watching file and executing tests whenever any file changes
        // CLI --auto-watch --no-auto-watch
        autoWatch: false,

        // Start these browsers, currently available:
        // - Chrome
        // - ChromeCanary
        // - Firefox
        // - Opera
        // - Safari (only Mac)
        // - PhantomJS
        // - IE (only Windows)
        // CLI --browsers Chrome,Firefox,Safari
        browsers: ['PhantomJS'],

        // If browser does not capture in given timeout [ms], kill it
        // CLI --capture-timeout 5000
        captureTimeout: 20000,

        // Auto run tests on start (when browsers are captured) and exit
        // CLI --single-run --no-single-run
        singleRun: true,

        // report which specs are slower than 500ms
        // CLI --report-slower-than 500
        reportSlowerThan: 500,

        preprocessors: {
            'tests/app/**/*.coffee': ['coffee']
        },

        coffeePreprocessor: {
            // options passed to the coffee compiler
            options: {
                bare: true,
                sourceMap: true
            },
            // transforming the filenames
            transformPath: function (path) {
                return path.replace(/\.coffee$/, '.js');
            }
        },

        plugins: [
            'karma-jasmine',
            'karma-chrome-launcher',
            'karma-firefox-launcher',
            'karma-phantomjs-launcher',
            'karma-coffee-preprocessor'
        ]
    });
};