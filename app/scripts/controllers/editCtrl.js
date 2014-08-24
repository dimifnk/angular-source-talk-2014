angular.module("angularDemo").controller("editCtrl", function ($scope, address, $location) {

    "use strict";

    $scope.address = address;

    $scope.save = function () {
        $scope.address.$save().$promise.then(goToRoot);
    };

    $scope.delete = function () {
        $scope.address.$delete().then(goToRoot);
    };

    function goToRoot() {
        $location.path("/");
    }

});
