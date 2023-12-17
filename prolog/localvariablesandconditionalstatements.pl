compare() :-
    write('Write the numbers: '), read(X),
     read(Y),
    (X > Y ->
        write('X is bigger value.'), nl;
        (X < Y ->
            write('Y is bigger value.'), nl;
            write('Both numbers are equal.'), nl)),
    !.