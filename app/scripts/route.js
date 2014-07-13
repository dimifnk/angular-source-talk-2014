"use strict";
angular.module("angularDemo")
    .config([
        "$routeProvider",
        "$locationProvider",
        function($routeProvider) {
            $routeProvider
                .when("/", {
                    templateUrl: "/assets/views/addresses.html",
                    controller: "addressesCtrl"
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
        }
    ]
);
