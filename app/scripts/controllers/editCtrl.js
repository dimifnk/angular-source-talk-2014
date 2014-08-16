"use strict";
angular.module("angularDemo").controller("editCtrl", [
    "$scope",
    "address",
    "$location",
    function ($scope, address, $location) {
        $scope.address = address;

        $scope.save = function () {
            $scope.address.$save().then(goToRoot);
        };

        $scope.delete = function () {
            $scope.address.$delete().then(goToRoot);
        };

        function goToRoot() {
            $location.path("/");
        }

    }
]);
