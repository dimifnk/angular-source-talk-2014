"use strict";
angular.module("angularDemo")
    .controller("addressesCtrl", [
        "$scope",
        "Addresses",
        function ($scope, Addresses) {
            $scope.addresses = Addresses.query();

            $scope.selected = [];

            $scope.deleteSelected = function(){
                $scope.selected.forEach(function(address){
                    if(address){
                        Addresses.delete({}, {id:address});
                    }
                });
            };
        }
]);