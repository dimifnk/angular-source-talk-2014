"use strict";
angular.module("angularDemo")
    .config([
        "$routeProvider",
        "$locationProvider",
        function($routeProvider, $locationProvider) {
            $locationProvider.html5Mode(true);
            $routeProvider
                .when("/addresses", {
                    templateUrl: "/assets/views/addresses.html",
                    controller: "addressesCtrl"
                })
                .when("/addresses/add", {
                    templateUrl: "/assets/views/edit.html",
                    controller: "editCtrl"
                })
                .when("/addresses/edit/:id", {
                    templateUrl: "/assets/views/edit.html",
                    controller: "editCtrl"
                })
                .otherwise({
                    redirectTo: "/addresses"
                });
        }
    ]
);
