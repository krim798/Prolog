factorial(0, 1).
factorial(X, Result) :-
    integer(X),
    X > 0,
    X1 is X - 1,
    factorial(X1, Result1),
    Result is X * Result1.

factorial(N, 0) :-
    integer(N),
    N < 0.