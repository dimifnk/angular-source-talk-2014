angular.module("angularDemo", ["ngRoute", "ngResource"], [
    "$routeProvider",
    "$locationProvider",
    function($routeProvider, $locationProvider) {

        "use strict";

        var ensureAllAddressesFetched = ["addresses", function (addresses) {
                return addresses.all;
        }];

        $locationProvider.html5Mode(true);
        $routeProvider
            .when("/addresses", {
                templateUrl: "/assets/views/addresses.html",
                controller: "addressesCtrl",
                resolve: {
                    whenAllAddressesFetched: ensureAllAddressesFetched
                }
            })
            .when("/edit", {
                templateUrl: "/assets/views/edit.html",
                controller: "editCtrl",
                resolve: {
                    whenAllAddressesFetched: ensureAllAddressesFetched
                }
            })
            .when("/edit/:addressId", {
                templateUrl: "/assets/views/edit.html",
                controller: "editCtrl",
                resolve: {
                    whenAllAddressesFetched: ensureAllAddressesFetched
                }
            })
            .otherwise({
                redirectTo: "/addresses"
            });
    }
]);