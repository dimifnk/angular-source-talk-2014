angular-source-talk-2014
========================

Installation
------------

* Make sure, you have [nodejs](http://nodejs.org) installed on your system.
* Install grunt-cli: `npm install -g grunt-cli`
* Clone the project
* run `npm install` in the project root (this will install all project backend dependencies)

Development
-----------

* Run `grunt dev` to create a development build and run a server. Additionally your files will be watched to update the build incrementally and refresh your browser via livereload. You can add the following browser plugins to gain the benefits of livereload:
    * [Chrome](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)
    * [Firefox](https://addons.mozilla.org/de/firefox/addon/livereload/)

Deployment
----------

* Run `grunt dist` to create a distribution build (all necessary assets are placed in the `dist` directory).
* Run `grunt dist_server` to create a distribution build and start a server which provides the distribution content.