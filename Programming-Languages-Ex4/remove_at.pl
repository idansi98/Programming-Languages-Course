remove_at(X, [X|T], 1, T).
remove_at(X, [H|T], N, [H|R]) :- N > 1, N1 is N - 1, remove_at(X, T, N1, R).

//Write a predicate to insert an element at a given position into a list.
//Example:
//?- insert_at(alfa,[a,b,c,d],2,L).
//L = [a,alfa,b,c,d]


# Path: insert_at.pl
insert_at(X, L, 1, [X|L]).
insert_at(X, [H|T], N, [H|R]) :- N > 1, N1 is N - 1, insert_at(X, T, N1, R).