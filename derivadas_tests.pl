:- consult('derivadas.pl').
:- use_module(library(plunit)).

:- begin_tests(derivadas).

test(logaritmo_cociente) :-
    derivada(ln(x/(x+1)), Y),
    Esperado = (1*(x+1)-x*(1+0))/(x+1)^2/(x/(x+1)),
    assertion(Y == Esperado).

test(seno_exponencial) :-
    derivada(sen(exp(3*x)), Y),
    Esperado = cos(exp(3*x))*(exp(3*x)*(3*1)),
    assertion(Y == Esperado).

test(logaritmo_seno_cociente) :-
    derivada(ln(sen((x+1)/x)), Y),
    Esperado = (cos((x+1)/x)*(((1+0)*x-(x+1)*1)/x^2))/sen((x+1)/x),
    assertion(Y == Esperado).

test(cociente_polinomios) :-
    derivada((x^5+x^3)/(x^2+1), Y),
    Esperado = ((5*x^4+3*x^2)*(x^2+1)-(x^5+x^3)*(2*x^1+0))/(x^2+1)^2,
    assertion(Y == Esperado).

test(arctangente_compuesta) :-
    derivada(arctan((x^2+1)^10), Y),
    Esperado = 10*(x^2+1)^9*(2*x^1+0)/(1+((x^2+1)^10)^2),
    assertion(Y == Esperado).

test(coseno_compuesto) :-
    derivada(cos(x^2), Y),
    assertion(Y == -sen(x^2)*(2*x^1)).

test(producto_general) :-
    derivada(x*sen(x), Y),
    Esperado = 1*sen(x)+x*(cos(x)*1),
    assertion(Y == Esperado).

test(tangente_compuesta) :-
    derivada(tan(x+1), Y),
    assertion(Y == (1+0)/cos(x+1)^2).

test(resta) :-
    derivada(x^2-x, Y),
    assertion(Y == 2*x^1-1).

test(negacion) :-
    derivada(-x, Y),
    assertion(Y =.. ['-', 1]).

test(potencia_cero) :-
    derivada((x+1)^0, Y),
    assertion(Y == 0).

test(expresion_no_admitida, [fail]) :-
    derivada(raiz(x), _).

test(expresion_no_instanciada, [fail]) :-
    derivada(_, _).

:- end_tests(derivadas).
