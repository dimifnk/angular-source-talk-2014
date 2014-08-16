angular.module("angularDemo").config(function ($routeProvider) {

    "use strict";

    $routeProvider
        .when("/", {
            templateUrl: "/assets/views/addresses.html",
            controller: "addressesCtrl"
        })
        .when("/add", {
            templateUrl: "/assets/views/edit.html",
            controller: "editCtrl",
            resolve: {
                address: function ($route, Addresses) {
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
