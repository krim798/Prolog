:- op(900, fy, *).
:- op(800, xfy, :).
:- op(700, xfy, +).
:- op(600, xfy, -).
:- op(500, xfy, *).
:- op(400, xfy, /).

/* utility predicate to find a position of a value in a list */
pos(Val, List, Pos) :- nth1(Pos, List, Val).

/* define initial configuration of 8 puzzle */
initial([* | List1], [1,2,3,4,5,6,7,8]), 
         initial(List1, [2,3,6,7,1,8,4,5]),
         pos(1, List1, 1), pos(2, List1, 2), pos(3, List1, 3),
         pos(4, List1, 4), pos(5, List1, 5), pos(6, List1, 6),
         pos(7, List1, 7), pos(8, List1, 8).

/* goal configuration */
goal([1,2,3,4,5,6,7,8,*]).

/* successors predicate */
succ(List1, List2) :- append(List1a, [1,*,6,7,8], List1), 
                       append(List1a, [1,*,8,6,7], List2).
succ(List1, List2) :- append(List1a, [2,3,*,5,6,7,8], List1), 
                       append(List1a, [2,3,*,7,6,5,8], List2).
succ(List1, List2) :- append(List1a, [2,3,6,*,5,6,7,8], List1), 
                       append(List1a, [2,3,6,*,8,7,6,5], List2).
succ(List1, List2) :- append(List1a, [2,3,6,7,*,5,6,8], List1), 
                       append(List1a, [2,3,6,7,*,6,5,8], List2).
succ(List1, List2) :- append(List1a, [2,3,6,7,8,*,5,6], List1), 
                       append(List1a, [2,3,6,7,8,*,6,5,1], List2).
succ(List1, List2) :- append(List1a, [2,3,6,7,8,5,*,6], List1), 
                       append(List1a, [2,3,6,7,8,5,*,7,6], List2).
succ(List1, List2) :- append(List1a, [2,3,6,7,8,5,6,*,7], List1), 
                       append(List1a, [2,3,6,7,8,5,6,*,8,7], List2).

/* BFS solution using Prolog's breadth-first search mechanism */
solve(Initial, Solution) :-
    length(Initial, N),
    findall(Initial, goal(Initial), Goals),
    bfs([], Goals, Solution).

/* breadth-first search predicate */
bfs(Visited, Goals, Solution) :-
    Goals \= [],
    Goals = [Current|_],
    ( Current = Solution -> true
    ;
    extend(Current, NewVisited),
    findall(Current, goal(Current), Goals),
    bfs(NewVisited, Goals, Solution)
    ).

/* helper predicate to expand a state */
extend(Current, [Current|NewVisited]) :-
    findall(Successor, (succ(Current, Successor), \+ member(Successor, [Current|NewVisited])), Successors),
    append(Successors, NewVisited, AllVisited),
    AllVisited = [Current|NewVisited].