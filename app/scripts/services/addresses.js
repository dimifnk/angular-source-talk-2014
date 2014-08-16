"use strict";
angular.module("angularDemo")
    .factory("Addresses", [
        "resource",
        function(resource) {
            var schema = ["id", "firstname", "lastname", "street", "city", "zipcode", "country", "group", "email"];
            return resource("/data/addresses/:id", {id: "@id"}, schema);
        }
    ]
);