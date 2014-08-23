angular.module("angularDemo").factory("Addresses", function (resource) {

    "use strict";

    var schema = ["id", "firstname", "lastname", "street", "city", "zipcode", "country", "group", "email"];
    return resource("/data/addresses/:id", {id: "@id"}, schema);
});