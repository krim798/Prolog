% Define the function
square(X, Result) :-
    Result is X * X.

% Interactive prompt to accept input
:- initialization(main).

main :-
    write('Write a number: '),
    read(X),
    square(X, Result),
    write(' square of '), write(X), write(':'), write(Result), nl.