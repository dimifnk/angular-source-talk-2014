"use strict";
angular.module("angularDemo").controller("editCtrl", [
    "$scope",
    "address",
    "$location",
    function ($scope, address, $location) {
        $scope.address = address;

        $scope.save = function () {
            $scope.address.$save().$promise.then(goToRoot);
        };

        $scope.delete = function () {
            $scope.address.$delete().$promise.then(goToRoot);
        };

        function goToRoot() {
            $location.path("/");
        }

    }
]);
