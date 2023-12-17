action( 
    state(Pos1, Pos2, held),                 
    eat,
    state(Pos1, Pos2, eaten)                 
).

action(  
    state(onChair(Pos), Pos, onCeiling(Pos)),       
    grasp,      
    state(onChair(Pos), Pos, held)     
).
action(  
    state(onFloor(Pos), Pos, Status),                   
    climb,      
    state(onChair(Pos), Pos, Status)                    
).


action(
    state(onFloor(Pos), Pos, Status),                  
    push(Pos, NewPos),                                  
    state(onFloor(NewPos), NewPos, Status)              
).


action( 
    state(onFloor(Pos1), Pos2, Status),
    go(Pos1, NewPos1),                                  
    state(onFloor(NewPos1), Pos2, Status)
).



plan( State, State, []).                             

plan( State1, GoalState, [ Action1 | RestOfPlan]) :-
    action( State1, Action1, State2),             
    plan( State2, GoalState, RestOfPlan).             

%?- plan(state(onFloor(corner2), corner3, onCeiling(middle)), state(MonkeyPos, ChairPos, eaten), Plan).