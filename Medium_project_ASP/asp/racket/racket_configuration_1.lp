% choose one option V for every feature F of (enumeration) type T
{ value(F,V) : option(T,V) } = 1 :- feature(_,F,T,_,_).

%%%%%%%% Remove erroneous solutions from the program %%%%%%%%

% requirements of the program MUST hold under a holds_binary atom
:- behavior((S,C)), require((S,C),B), not holds_binary(B), binary(_,B,Left,"!=",Right).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%% generate holds-binary atoms if certain conditions apply %%%%%%%%

%create holds binary if Forehand and Backhand colors are NOT the same
holds_binary(B) :- binary(_,B,Left,"!=",Right), value(Left,LV), value(Right,RV), LV!=RV.

%if a requirement is present, create holds binary if binary is satisfied
holds_binary(B) :- binary(_,B,Left,"=",Right), value(Left,Right), require((S,C),B).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%% Create 'preference' atom to easily adhere to user preferences %%%%%

% allows users to select preferences, and retricts features based on that preference 
preference(B) :-  binary(_,B,Left,"=",Right), value(Left,Right), require((S,C),B1), condition((S,C), B), C>1.


:- behavior((S,C)), require((S,C),B1), preference(B), condition((S,C), B), not holds_binary(B1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%% Dealing with the bligatory 'combination' element %%%%%%%%%%%%%%%%%

:- combinations((S,C), 0, F1), combinations((S,C), 1, F2), C=9, value(F1, V1), allow((S,C), (0,Y), V1), allow((S,C), 
        (0,Y+1), V2), not value(F2, V2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#show value/2.