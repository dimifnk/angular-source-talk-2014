angular.module("angularDemo").factory("resource", function ($resource) {

    "use strict";

    return function (path, defaults, methods) {
        methods = methods || {};
        methods.update = {method: "PUT"};
        methods.create = {method: "POST"};
        var Resource = $resource(path, defaults, methods);
        Resource.prototype.$save = function () {
            if ("id" in this) {
                return this.$update.apply(this, arguments);
            }
            else {
                return this.$create.apply(this, arguments);
            }
        };

        return Resource;
    };
});