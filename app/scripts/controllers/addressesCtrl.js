angular.module("angularDemo").controller("addressesCtrl", [
    "$scope",
    "addresses",
    function ($scope, addresses) {

        "use strict";

        $scope.addresses = addresses.all;
    }
]);