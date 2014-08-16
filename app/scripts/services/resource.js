/**
 * This implementation of a resource is quite similar to $resource and uses it under the hood.
 * The differences are:
 * - create uses POST
 * - update uses PUT
 * - save calls create or update. The "id" property of the instance determines which method to call
 * - You can pass a schema which gives you the ability to send cleaned objects with the $save method
 */

angular.module("angularDemo").factory("resource", function ($resource) {

    "use strict";

    return function (path, defaults, schema, methods) {
        methods = methods || {};
        methods.update = {method: "PUT"};
        methods.create = {method: "POST"};
        var Resource = $resource(path, defaults, methods);
        Resource.save = function(res) {
            new Resource(res).$save();
        };
        Resource.prototype.$save = function () {
            var clean = _.pick(this, schema);
            if ("id" in this) {
                return Resource.update(clean);
            }
            else {
                return Resource.create(clean);
            }
        };

        return Resource;
    };
});