function memoize(f) {
    var cache = {};
    return function (n) {
        if (n in cache) {
            return cache[n];
        } else {
            var result = f(n);
            cache[n] = result;
            return result;
        }
    };
}

