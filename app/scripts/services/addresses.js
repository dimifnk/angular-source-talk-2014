"use strict";
angular.module("angularDemo")
    .factory("addresses", [
        "$resource",
        function($resource) {
            var service = $resource("/data/addresses");
            service.all = service.query();
            return service;
        }
    ]
);