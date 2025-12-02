transfer(X, Y) :-
    Y is X.
    
transfer2(X,X).


outputprint :-
    write('Hello World!'), nl.



if_example(X) :-
    ( X > 0 ->
        write('X is positive'), nl
    ; X < 0 ->
        write('X is negative'), nl
    ;
        write('X is zero'), nl
    ).

read_the_input(Input) :-
    write('Please enter something: '), nl,
    read(Input),
    write('You entered: '), write(Input), nl.
main :-
    read_the_input(Input), nl,
    transfer(Input, Input1),
    if_example(Input1).