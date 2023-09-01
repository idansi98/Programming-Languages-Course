function memoize(f) {
    var cache = {};
    return function (... args) {
        var key = JSON.stringify(args);
        if (key in cache) {
            return cache[key];
        } else {
            var result = f(... args);
            cache[key] = result;
            return result;
        }
    };  
}
