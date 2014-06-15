angular.module("angularDemo").controller("sendParcelCtrl", [
    "$scope",
    "addresses",
    function ($scope, addresses) {
        $scope.addresses = addresses.all;
    }
]);