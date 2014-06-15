angular.module("angularDemo", ["ngRoute", "ngResource"], [
    "$routeProvider",
    "$locationProvider",
    function($routeProvider, $locationProvider) {

        "use strict";

        var ensureAllAddressesFetched = ["addresses", function (addresses) {
                return addresses.all;
            }],
            ensureAllParcelsFetched = ["parcels", function (parcels) {
                return parcels.all;
            }];

        $locationProvider.html5Mode(true);
        $routeProvider
            .when("/", {
                templateUrl: "/assets/views/main.html"
            })
            .when("/addresses", {
                templateUrl: "/assets/views/addresses.html",
                controller: "addressesCtrl",
                resolve: {
                    whenAllAddressesFetched: ensureAllAddressesFetched
                }
            })
            .when("/parcels", {
                templateUrl: "/assets/views/parcels.html",
                controller: "parcelsCtrl",
                resolve: {
                    whenAllParcelsFetched: ensureAllParcelsFetched
                }
            })
            .when("/send-parcel", {
                templateUrl: "/assets/views/send-parcel.html",
                controller: "sendParcelCtrl",
                resolve: {
                    whenAllAddressesFetched: ensureAllAddressesFetched
                }
            })
            .otherwise({
                redirectTo: "/"
            });
    }
]);