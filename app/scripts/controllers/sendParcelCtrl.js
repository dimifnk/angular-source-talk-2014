angular.module("angularDemo").controller("sendParcelCtrl", [
    "$scope",
    "addresses",
    function ($scope, addresses) {

        "use strict";

        $scope.addresses = addresses.all;
    }
]);