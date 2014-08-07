"use strict";
angular.module("angularDemo").controller("editCtrl", [
    "$scope",
    "$log",
    "address",
    function ($scope, $log, address) {
        $scope.address = address;
    }
]);
