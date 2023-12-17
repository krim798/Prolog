solve(A,B):-                                      %Input packaging
moves([s(A,B)],RevStates),                        %add list
reverse(RevStates,States),                        %reverse answers
write(States),nl,fail.                            %write and find all answer.                     

moves([s(X0,Y0)|T], [s(2,Y1),s(X0,Y0)|T])         %set goal
   :- action(s(X0,Y0),s(2,Y1)), !.                %cut off when find answer

moves([s(X0,Y0)|T],States) :-                
   action(s(X0,Y0),s(X1,Y1)),                     %find next node
    not(member(s(X1,Y1),[s(X0,Y0)|T])),           %not look for past nodes
    moves([s(X1,Y1),s(X0,Y0)|T],States).          %repeat moves
	

action(s(X,Y),s(Z,3)) :-    %from left jug to right jug until right full
X=<4,X>0,Y>=0,Y<3,Z is X - (3 - Y), Z >= 0.
action(s(X,Y),s(Z,0)) :-    %from right jug to left jug until right empty
X<4,X>=0,Y>0,Y=<3,Z is X + Y, Z =< 4.
action(s(X,Y),s(4,Z)) :-    %from right jug to left jug until left full 
X<4,X>=0,Y>0,Y=<3,Z is Y - (4 - X), Z >=0.
action(s(X,Y),s(0,Z)) :-    %from left jug to right jug until left empty
X=<4,X>0,Y>=0,Y<3,Z is X + Y, Z =< 3.

action(s(X,Y),s(4,Y)):-     %fill left jug (4) 
X<4,X>=0,Y>=0,Y=<3.
action(s(X,Y),s(X,3)):-     %fill right jug (3)
X=<4,X>=0,Y>=0,Y<3.
action(s(X,Y),s(X,0)) :-    %empty right jug 
X=<4,X>=0,Y>0,Y=<3.
action(s(X,Y),s(0,Y)) :-    %empty left jug 
X=<4,X>0,Y>=0,Y=<3.