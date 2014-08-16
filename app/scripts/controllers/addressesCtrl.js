angular.module("angularDemo").controller("addressesCtrl", function ($scope, Addresses, $q) {

    "use strict";

    var addresses = $scope.addresses = Addresses.query();

    $scope.columns = ["firstname", "lastname", "city", "country", "group"];

    $scope.deleteSelected = function () {
        var selected = _.where(addresses, {selected: true});
        $q.all(selected.map(function(address) {
            return address.$delete().$promise;
        })).then(function() {
            var addresses = $scope.addresses = Addresses.query();
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