angular.module("angularDemo").controller("editCtrl", function ($scope, address, $location) {

    "use strict";

    $scope.address = address;

    function goToRoot() {
        $location.path("/");
    }

});
