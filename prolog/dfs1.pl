edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).
edge(c,f).
edge(c,g).

show_edges:-
    write("Edges of the graph: "), nl,
    edge(X,Y), write(X), write("---"), write(Y), nl, fail.
show_edges.

show_neighbors(Node):-
    write("Neighbors of "), write(Node), write(": "),
    nl, (edge(Node, Neighbor);edge(Neighbor, Node)), write(Neighbor), nl, fail.
 show_neighbors(Node):- write("Done finding neighbors for: "),
 write(Node), nl.

show_graph:-
    show_edges, nl, show_neighbors(a), nl, show_neighbors(b), nl, show_neighbors(c),
    nl, show_neighbors(d), nl, show_neighbors(e), nl, show_neighbors(f), nl,
    show_neighbors(g).

dfs(Node, Visited):-
    write("Visiting Node: "), write(Node), nl,
    edge(Node, Neighbor),
    not(member(Neighbor, Visited)),
    dfs(Neighbor, [Node|Visited]).
dfs(Node, []):- write("Done Searching from: "), write(Node), nl.
