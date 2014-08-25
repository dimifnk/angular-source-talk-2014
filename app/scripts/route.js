angular.module("angularDemo").config(function ($routeProvider, $locationProvider) {

    "use strict";

    $locationProvider.html5Mode(true);
    $routeProvider
        .when("/", {
            templateUrl: "/assets/views/addresses.html",
            controller: "addressesCtrl",
            resolve: {
                addresses: function(Addresses) {
                    return Addresses.query();
                }
            }
        })
        .when("/add", {
            templateUrl: "/assets/views/edit.html",
            controller: "editCtrl"
        })
        .when("/edit/:id", {
            templateUrl: "/assets/views/edit.html",
            controller: "editCtrl"
        })
        .otherwise({
            redirectTo: "/"
        });
});
