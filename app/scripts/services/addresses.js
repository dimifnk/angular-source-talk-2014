angular.module("angularDemo").factory("addresses", ["$resource", function($resource) {

    "use strict";

    var service = $resource("/data/addresses");

    service.all = service.query();

    return service;
}]);