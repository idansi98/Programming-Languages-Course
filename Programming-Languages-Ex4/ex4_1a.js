//a) F(n)=n! (F(n)=n*F(n-1), F(0)=1)

function memoisedFactorial(n, cache) {
    cache = cache || [1]
    if (cache[n])
        return cache[n]
    return cache[n] = n * memoisedFactorial(n - 1, cache);
}


//console.log(memoisedFactorial(100));

