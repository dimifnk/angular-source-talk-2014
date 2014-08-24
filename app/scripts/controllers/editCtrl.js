angular.module("angularDemo").controller("editCtrl", function ($scope, address, $location) {

    "use strict";

    $scope.address = address;

    $scope.save = function () {
        $scope.address.$save(goToRoot);
    };

    $scope.delete = function () {
        $scope.address.$delete(goToRoot);
    };

    function goToRoot() {
        $location.path("/");
    }

});
