angular.module("angularDemo").controller("addressesCtrl", function ($scope, addresses, Addresses, $q, $timeout) {

    "use strict";

    $scope.addresses = addresses;

    $scope.columns = ["firstname", "lastname", "city", "country", "group"];

    $scope.deleteSelected = function () {
        var selected = _.where(addresses, {selected: true});
        $q.all(selected.map(function(address) {
            return address.$delete().$promise;
        })).then($scope.reload);
    };

    $scope.reload = function () {
        // addresses = $scope.addresses = Addresses.query();
        Addresses.query(function (addrs) {
            addresses = $scope.addresses = addrs;
        });
    };

    $scope.reorder = function(order) {
        if($scope.order !== order) {
            $scope.reverseOrder = true;
        }
        $scope.order = order;
        $scope.reverseOrder = !$scope.reverseOrder;
    };
});