% ---------- Facts ----------
% parent(Parent, Child)

% Potter family
parent(fleamont_potter, james_potter).
parent(euphemia_potter, james_potter).
parent(james_potter, harry_potter).
parent(lily_potter, harry_potter).

% Evans family
parent(mr_evans, lily_potter).
parent(mrs_evans, lily_potter).
parent(mr_evans, petunia_dursley).
parent(mrs_evans, petunia_dursley).

% Dursley family
parent(vernon_dursley, dudley_dursley).
parent(petunia_dursley, dudley_dursley).

% Weasley family
parent(arthur_weasley, bill_weasley).
parent(molly_weasley, bill_weasley).
parent(arthur_weasley, charlie_weasley).
parent(molly_weasley, charlie_weasley).
parent(arthur_weasley, percy_weasley).
parent(molly_weasley, percy_weasley).
parent(arthur_weasley, fred_weasley).
parent(molly_weasley, fred_weasley).
parent(arthur_weasley, george_weasley).
parent(molly_weasley, george_weasley).
parent(arthur_weasley, ron_weasley).
parent(molly_weasley, ron_weasley).
parent(arthur_weasley, ginny_weasley).
parent(molly_weasley, ginny_weasley).

% Next generation
parent(harry_potter, james_sirius_potter).
parent(ginny_weasley, james_sirius_potter).
parent(harry_potter, albus_severus_potter).
parent(ginny_weasley, albus_severus_potter).
parent(harry_potter, lily_luna_potter).
parent(ginny_weasley, lily_luna_potter).

% Gender facts
male(fleamont_potter).
male(james_potter).
male(harry_potter).
male(mr_evans).
male(vernon_dursley).
male(dudley_dursley).
male(arthur_weasley).
male(bill_weasley).
male(charlie_weasley).
male(percy_weasley).
male(fred_weasley).
male(george_weasley).
male(ron_weasley).
male(james_sirius_potter).
male(albus_severus_potter).

female(euphemia_potter).
female(lily_potter).
female(mrs_evans).
female(petunia_dursley).
female(molly_weasley).
female(ginny_weasley).
female(lily_luna_potter).

% ---------- Rules ----------
father(F, C) :- parent(F, C), male(F).
mother(M, C) :- parent(M, C), female(M).

sibling(X, Y) :-
    parent(P, X), parent(P, Y),
    X \= Y.

grandparent(GP, C) :-
    parent(GP, P),
    parent(P, C).

% Recursive ancestor rule
ancestor(A, D) :-
    parent(A, D).
ancestor(A, D) :-
    parent(A, X),
    ancestor(X, D).
