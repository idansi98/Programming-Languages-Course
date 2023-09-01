is_prime(N) :-
    N > 1,
    N = 2;
    N > 2,
    floor(sqrt(N), SqrtN),
    \+ (
        between(2, SqrtN, L),
        0 is N mod L
    ).

