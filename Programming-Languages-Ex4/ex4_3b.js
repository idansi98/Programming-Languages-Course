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

var memoisedFibonacci2 = memoize(function (n) {
    if (n === 0) {
        return 0;
    } else if (n === 1 || n === 2) {
        return 1;
    } else {
        return memoisedFibonacci(n - 1) + memoisedFibonacci(n - 2);
    }
});


//console.log(memoisedFibonacci2(150));
