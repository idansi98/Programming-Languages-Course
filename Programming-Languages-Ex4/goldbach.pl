is_prime(N) :-
    N > 1,
    N = 2;
    N > 2,
    floor(sqrt(N), SqrtN),
    \+ (
        between(2, SqrtN, L),
        0 is N mod L
    ).


goldbach(N, L) :-
    N > 2,
    between(2, N, H),
    is_prime(H),
    T is N - H,
    is_prime(T),
    L = [H, T],
    !.

goldbach(_, []).








