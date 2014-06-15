angular.module("angularDemo").controller("parcelsCtrl", [
    "$scope",
    "parcels",
    function ($scope, parcels) {

        "use strict";

        $scope.parcels = parcels.all;
    }
]);