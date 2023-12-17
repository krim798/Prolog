name(Krishan).
branch(aiml).
subject(mechanics).
marks(65).
list_1(K,[K,r,i,s,h,a,n]).
list_2(m,[m,i,t,t,a,l]).
concat([].L2.L3).
concat([x|L1],L2,[x|L3]):-concat(L1,L2,L3).
