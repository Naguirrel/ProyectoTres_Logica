% Derivacion simbolica con respecto a x.
% Sintaxis admitida: numeros, x, +, -, *, /, ^ (exponente numerico),
% sen/1, cos/1, tan/1, arctan/1, exp/1 y ln/1.
% Se construye el resultado sin simplificarlo.

derivada(Expresion, Resultado) :-
    ground(Expresion),
    once(derivar(Expresion, Resultado)).

derivar(Constante, 0) :-
    number(Constante).
derivar(x, 1).

derivar(A+B, DA+DB) :-
    derivar(A, DA),
    derivar(B, DB).
derivar(A-B, DA-DB) :-
    derivar(A, DA),
    derivar(B, DB).
derivar(-A, -DA) :-
    derivar(A, DA).
derivar(C*U, C*DU) :-
    number(C),
    derivar(U, DU).
derivar(U*C, DU*C) :-
    number(C),
    derivar(U, DU).
derivar(A*B, DA*B+A*DB) :-
    derivar(A, DA),
    derivar(B, DB).
derivar(A/B, (DA*B-A*DB)/B^2) :-
    derivar(A, DA),
    derivar(B, DB).

derivar(_Base^N, 0) :-
    number(N),
    N =:= 0.
derivar(x^N, N*x^M) :-
    number(N),
    M is N-1.
derivar(Base^N, N*Base^M*DBase) :-
    number(N),
    M is N-1,
    derivar(Base, DBase).

derivar(sen(U), cos(U)*DU) :-
    derivar(U, DU).
derivar(cos(U), -sen(U)*DU) :-
    derivar(U, DU).
derivar(tan(U), DU/cos(U)^2) :-
    derivar(U, DU).
derivar(arctan(U), DU/(1+U^2)) :-
    derivar(U, DU).
derivar(exp(U), exp(U)*DU) :-
    derivar(U, DU).
derivar(ln(U), DU/U) :-
    derivar(U, DU).
