and(A, B) :- A, B.
or(A, B) :- A; B.
not(A) :- \+ A.
xor(A, B) :- (not(A),B) ; (A, not(B)).
nand(A, B) :- not(and(A, B)).
nor(A, B) :- not(or(A, B)).
equal(A, B) :- (A,B) ; (not(A), not(B)).


table(Var1, Var2, Expression) :-
    ((Var1 = true, Var2 = true, call(Expression) -> write('true true true'); write("true true fail")), nl, fail);
    ((Var1 = true, Var2 = fail, call(Expression) -> write('true fail true'); write("true fail fail")), nl, fail);
    ((Var1 = fail, Var2 = true, call(Expression) -> write('fail true true'); write("fail true fail")), nl, fail);
    ((Var1 = fail, Var2 = fail, call(Expression) -> write('fail fail true'); write("fail fail fail")), nl, fail);
    true.

