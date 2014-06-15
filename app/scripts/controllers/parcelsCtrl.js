angular.module("angularDemo").controller("parcelsCtrl", [
    "$scope",
    "parcels",
    function ($scope, parcels) {
        $scope.parcels = parcels.all
    }
]);