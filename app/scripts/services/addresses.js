"use strict";
angular.module("angularDemo")
    .factory("Addresses", [
        "resource",
        function(resource) {
            return resource("/data/addresses/:id", {id: "@id"});
        }
    ]
);