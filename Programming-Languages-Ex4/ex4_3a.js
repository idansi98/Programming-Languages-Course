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


var memoisedFactorial2 = memoize(function (n) {
    if (n === 0) {
        return 1;
    } else {
        return n * memoisedFactorial(n - 1);
    }
});

//console.log(memoisedFactorial2(170));