"use strict";
angular.module("angularDemo").controller("editCtrl", [
    "$scope",
    "address",
    function ($scope, address) {
        $scope.address = address;

        $scope.save = function(){
            $log.log("save");
            $scope.address.$save();
        };

        $scope.delete = function(){
            $log.log("delete");
            $scope.address.$delete();
        };

    }
]);
