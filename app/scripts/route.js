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
            controller: "editCtrl",
            resolve: {
                address: function (Addresses) {
                    return new Addresses();
                }
            }
        })
        .when("/edit/:id", {
            templateUrl: "/assets/views/edit.html",
            controller: "editCtrl",
            resolve: {
                address: function ($route, Addresses) {
                    return Addresses.get({id: $route.current.params.id});
                }
            }
        })
        .otherwise({
            redirectTo: "/"
        });
});
