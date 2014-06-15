angular.module("angularDemo").factory("parcels", ["$resource", function($resource) {

    "use strict";

    var service = $resource("/data/parcels");

    service.all = service.query();

    return service;
}]);