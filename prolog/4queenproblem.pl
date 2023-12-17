loc([1,1]). loc([1,2]). loc([1,3]). loc([1,4]).
loc([2,1]). loc([2,2]). loc([2,3]). loc([2,4]).
loc([3,1]). loc([3,2]). loc([3,3]). loc([3,4]).
loc([4,1]). loc([4,2]). loc([4,3]). loc([4,4]).

fourQueens([]).   

fourQueens([Q|QS]) :-   
	fourQueens(QS),
	loc(Q),
	valid(Q, QS).

valid([A|B], []).    

valid([A|B], [[C|D]|QS]) :-     
	A =\= C,			
	B =\= D,			
	C - A =\= D - B,	 
	C - A =\= B - D,     
	valid([A|B], QS).


