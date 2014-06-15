angular.module("angularDemo").controller("addressesCtrl", [
    "$scope",
    "addresses",
    function ($scope, addresses) {
        $scope.addresses = addresses.all;
    }
]);