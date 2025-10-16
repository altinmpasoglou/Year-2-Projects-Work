% part 1a) 


parent(kronos, zeus).
parent(rhea, zeus).
parent(kronos, hera).
parent(rhea, hera).
parent(zeus, ares).
parent(hera, ares).
parent(zeus, hebe).
parent(hera, hebe).
parent(zeus, hephaestus).
parent(hera, hephaestus).
parent(zeus, athena).
parent(zeus, apollo).
parent(zeus, artemis).
parent(leto, apollo).
parent(leto, artemis).
parent(zeus, persephone).
parent(demeter, persephone).
parent(zeus, hermes).
parent(zeus, dionysus).

male(kronos).
male(zeus).
male(ares).
male(hephaestus).
male(apollo).
male(hermes).
male(dionysus).

female(rhea).
female(hera).
female(athena).
female(artemis).
female(persephone).
female(hebe).
female(leto).
female(demeter).

% part 1b)


father(X, Y) :- 
         parent(X, Y), 
          male(X).
mother(X, Y) :- 
         parent(X, Y), 
         female(X).
sisters(X, Y) :- 
         female(X), 
        female(Y), 
        parent(Z, X), 
        parent(Z, Y), X \= Y.
step_sisters(X, Y) :- 
                female(X), 
                female(Y), 
            (parent(Z, X), 
            parent(Z, Y); 
            parent(W, X), 
            parent(W, Y)), not((parent(Z, X), parent(Z, Y), Z = W)), X \= Y.
brothers(X, Y) :- 
            male(X), 
            male(Y), 
         parent(Z, X), 
        parent(Z, Y), X \= Y.
step_brothers(X, Y) :- 
                 male(X), 
                male(Y), 
             (parent(Z, X), 
             parent(Z, Y); 
             parent(W, X), 
          parent(W, Y)), not((parent(Z, X), parent(Z, Y), Z = W)), X \= Y.
grandparent(X, Y) :- 
            parent(X, Z), 
             parent(Z, Y).
grandfather(X, Y) :- 
             grandparent(X, Y),
              male(X).
grandmother(X, Y) :- 
             grandparent(X, Y), 
            female(X).
ancestor(X, Y) :- 
                parent(X, Y).
ancestor(X, Y) :- 
                parent(X, Z), 
                ancestor(Z, Y).


% part 1c)

?- father(zeus, ares).
?- father(zeus, X).
?- mother(hera, hebe).
?- mother(leto, artemis).
?- sisters(artemis, athena).
?- sisters(X, Y).
?- step_sisters(persephone, hebe).
?- step_sisters(X, Y).


% part 1d)

% - ?- X(artemis, artemis)  X is not defined as a predicate, it should be a relation.
% - ?- male(kostas)  kostas is not listed anywhere, specifically in the male facts.
% - ?- child_of(zeus, artemis) "child_of" isnt defined anywhere and it'd best to use the parent predicate.

