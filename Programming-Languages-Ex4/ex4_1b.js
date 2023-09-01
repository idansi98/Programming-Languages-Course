//b) F(n) returns Fibonacci number n. F(n)=F(n-1)+F(n-2), F(0)=0, F(1)=F(2)=1

function memoisedFibonacci(n, cache) {
    cache = cache || [0, 1, 1]
    if (cache[n])
        return cache[n]
    return cache[n] = memoisedFibonacci(n - 1, cache) + 
    memoisedFibonacci(n - 2, cache);
}

//console.log(memoisedFibonacci(300));