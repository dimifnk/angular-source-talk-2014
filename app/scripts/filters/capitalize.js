angular.module("angularDemo").filter("capitalize", function() {

    "use strict";

    return function(input) {
        return input[0].toUpperCase() + input.substr(1);
    };
});