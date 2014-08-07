"use strict";
angular.module("angularDemo")
    .controller("addressesCtrl", [
        "$scope",
        "Addresses",
        function ($scope, Addresses) {
            $scope.addresses = Addresses.query();
        }
]);