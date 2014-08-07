"use strict";
angular.module("angularDemo").controller("editCtrl", [
    "$scope",
    "address",
    function ($scope, address) {
        $scope.address = address;

        $scope.save = function(){
            $scope.address.$save();
        };

        $scope.delete = function(){
            $scope.address.$delete();
        };

    }
]);
