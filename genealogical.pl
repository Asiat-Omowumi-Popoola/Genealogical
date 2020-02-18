% Gender of each menber is stated.
male(malik).
male(qudus).
male(tope).
male('Mr Abioye').
male('Mr Bode').
male('Mr Afeez ').
male('Mr Luqma').
male('Mr Sodiq ').
male('Mr Abass').
male('Uncle Wale').
male('Uncle Sola').
male('Mr Adisa').
female(temi).
female(rofia).
female(alima).
female('Mrs Abioye').
female('Mrs Bode').
female('Mrs Ruqoya ').
female('Mrs Aisha ').
female('Mrs Alia ').
female('Mrs Roheema').
female('Aunt Kemi').
female('Aunt Doyin').
female('Mrs Wala').
% Parent-child relatonship.
parent('Mr Abioye', malik).
parent('Mrs Abioye', malik).
parent('Mr Abioye', rofia).
parent('Mrs Abioye', rofia).
parent('Mr Bode',qudus).
parent('Mrs Bode', qudus).
parent('Mr Bode',alima).
parent('Mrs Bode', alima).
parent('Uncle Wale', temi).
parent('Mrs Wala', temi).
parent('Mr Adisa', tope ).
parent('Aunt Doyin', tope).
parent('Mrs Ruqoya ', 'Mr Abioye').
parent('Mr Afeez ', 'Mr Abioye').
parent('Mrs Alia ','Mrs Abioye' ).
parent('Mr Sodiq', 'Mrs Abioye').
parent('Mrs Ruqoya', 'Uncle Wale').
parent('Mr Afeez ', 'Uncle Wale').
parent('Mrs Ruqoya ','Aunt Kemi').
parent('Mr Afeez ', 'Aunt Kemi').
parent('Mrs Aisha', 'Mr Bode').
parent('Mr Luqma', 'Mr Bode').
parent('Mrs Roheema', 'Mrs Bode').
parent('Mr Abass', 'Mrs Bode').
parent('Mrs Roheema','Uncle Sola').
parent('Mr Abass', 'Uncle Sola').
parent('Mrs Roheema', 'Aunt Doyin').
parent('Mr Abass', 'Aunt Doyin').
% grandparent to child relationship.
grand_parent('Mrs Ruqoya',malik).
grand_parent('Mr Afeez',malik).
grand_parent('Mrs Alia',malik).
grand_parent('Mr Sodiq',malik).
grand_parent('Mrs Ruqoya',rofia).
grand_parent('Mr Afeez',rofia).
grand_parent('Mrs Alia',rofia).
grand_parent('Mr Sodiq',rofia).
grand_parent('Mrs Ruqoya',temi).
grand_parent('Mr Afeez',temi).
grand_parent('Mrs Aisha',alima).
grand_parent('Mr Luqma',alima).
grand_parent('Mrs Roheema',alima).
grand_parent('Mr Abass',alima).
grand_parent('Mrs Aisha',qudus).
grand_parent('Mr Luqma',qudus).
grand_parent('Mrs Roheema',qudus).
grand_parent('Mr Abass',qudus).
grand_parent('Mrs Roheema',tope).
grand_parent('Mr Abass',tope).
% rule for mother
mother(M,C):-parent(M,C), female(M).
% rule for father
father(M,C):-parent(M,C), male(M).
son(M):- parent(M,C), male(C), tab(2), write(C), nl, fail.
daughter(M):- parent(M,C), female(C), tab(2), write(C), nl, fail.
% rule for sibling
sibling(M,C):- parent(X,C),parent(X,M).
% built in predicate that succeed if two values are unequal, 
% and fails if they are the same
 M \= C .
% rules for brothers, sisters, uncles, aunts, and cousins.
brother(M, C):- parent(X,C),parent(X,M),male(M).
sister(M, C):-  parent(X,C),parent(X,M),female(M).
uncle(M,C):- sibling(M,N), parent(N,C), male(M).
aunt(M,C):- sister(M, N), parent(N,C).
cousine(M,C):- grand_parent(X,M), grand_parent(X,C). 
% Gender and connections
spouse('Mr Abioye', 'Mrs abioye').
spouse('Mr Bode', 'Mrs Bode').
spouse('Uncle Wale', 'Mrs Wale').
spouse('Mr Adisa', 'Aunt Doyin').
spouse('Mr Afeez', 'Mrs Rukoya').
spouse('Mr Sodiq', 'Mrs Alia').
spouse('Mr Luqma', 'Mrs Aisha').
spouse('Mr Abass', 'Mrs Roheema').
marraige(X,Y):- spouse(X,Y).
marraige(X,Y):- spouse(Y,X).
%  rules for uncles and aunts that get uncles and aunts by marriage
% as well as by blood.  
uncle(M,C):- parent(X,C),parent(Y,C), marraige(X,Y), brother(M,X).
uncle(M,C):- parent(X,C),parent(Y,C), marraige(X,Y), brother(M,Y).
aunt(M,C):- parent(X,C),parent(Y,C), marraige(X,Y), sister(M,X).
aunt(M,C):- parent(X,C),parent(Y,C), marraige(X,Y), sister(M,Y).
% Explore other relationships, such as those between in-laws.
% by blood or by marraige child().
% predicate to find both grandparent and grandchild
grandparent(Y,X):-parent(A,X),parent(Y,A).
grandparent(X,Y):-parent(X,A),parent(A,Y).
