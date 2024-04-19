% choose one option V for every feature F of (enumeration) type T
% { value(F,V) : option(T,V) } = 1 :- feature(_,F,T,_,_).

% it cannot be that the constraint (S,C) requires a binary formula B and B does not hold
% :- behavior((S,C)), require((S,C),B), not holds_binary(B).

% binary formula B of the form Left = Right holds if...
% holds_binary(B) :- binary(_,B,Left,"=",Right), value(Left,LV), value(Right,RV), LV = RV.

% display value
% #show value/2.





% choose one option V for every feature F of (enumeration) type T
{ value(F,V) : option(T,V) } = 1 :- feature(_,F,T,_,_).


%if the condition holds, then there must be a 'holds_binary' atom to satisfy the requirement the condition implies
:- behavior((S,C)), require((S,C),B1), holds_binary(B), condition((S,C), B), B!=B1, not holds_binary(B1).

%if there is no condition, there needs to be a 'holds_binary' atom to satisfy the requirement
:- behavior((S,C)), require((S,C),B1), not condition((S,C), _), not holds_binary(B1).

% % binary formula B of the form Left = Right holds if...
holds_binary(B) :- binary(_,B,Left,"=",Right), value(NLeft,LV), value(NRight,RV), LV = RV, path(FROM1,0,TO1), Left = FROM1, NLeft = TO1, path(FROM2,0,TO2), Right = FROM2, NRight = TO2.


% % BIKE 2 EXTENDED: 
:- value(F, V), allow((S,C), (0,Y), BOOL), allow((S,C), (_,Y), V), not value(F1,BOOL), combinations((S,C), 0, F1).



% Bike 3 kids: 
holds_binary(B) :- binary(_,B,Left,"=",Right), value(Left,Right), condition((S,C), B). 

holds_binary(B1) :- holds_binary(B), condition((S,C), B),
                        binary(_,B1,WHEEL,">",STR_SIZE),
                        path(OLD,0,NEW), 
                        value(NEW, STR_WSIZE),
                        attr_value(_,STR_WSIZE,_,INT_SIZE),
                        number(STR_SIZE_COMPARE,INT_COMPARE), INT_SIZE > INT_COMPARE.
                    



#show value/2.

