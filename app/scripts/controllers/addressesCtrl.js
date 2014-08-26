angular.module("angularDemo").controller("addressesCtrl", function ($scope, addresses, Addresses, $q, $timeout) {

    "use strict";

    $scope.addresses = addresses;

    $scope.reload = function () {
        // addresses = $scope.addresses = Addresses.query();
        Addresses.query(function (addrs) {
            addresses = $scope.addresses = addrs;
        });
    };
});