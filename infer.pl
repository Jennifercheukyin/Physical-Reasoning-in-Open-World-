:- dynamic notOccurs/3.
:- multifile(notOccurs/3).
:- multifile(holds/2).


infer(holds(TEND,GOAL)) :-
    holds(TEND,GOAL).

infer(holds(TEND,GOAL)) :-
    occurs(TA,TEND,ACT),
    condEffect(ACT,GOAL,QLIST),
    forall(member(Q,QLIST),infer(holds(TA,Q))).

infer(holds(TEND,GOAL)) :-
    earlier(TA,TEND),
    infer(holds(TA,GOAL)),
    persists(TA,TEND,GOAL).


   