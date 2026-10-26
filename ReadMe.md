# Derivadas simbólicas en Prolog

El predicado `derivada(Expresion, Resultado)` deriva respecto de `x`. Acepta
números, `x`, suma, resta, negación, multiplicación, división, potencias con
exponente numérico y las funciones `sen`, `cos`, `tan`, `arctan`, `exp` y `ln`.
Puede aplicar la regla de la cadena a funciones anidadas. Devuelve la expresión
simbólica **sin simplificar**. El primer argumento debe estar completamente
instanciado; una expresión no admitida hace que la consulta falle.

## Uso con SWI-Prolog

Desde este directorio, ejecute `swipl -s derivadas.pl` y escriba consultas como:

```prolog
?- derivada(ln(x/(x+1)), Y).
Y = (1*(x+1)-x*(1+0))/(x+1)^2/(x/(x+1)).

?- derivada(sen(exp(3*x)), Y).
Y = cos(exp(3*x))*(exp(3*x)*(3*1)).

?- derivada(ln(sen((x+1)/x)), Y).
Y = (cos((x+1)/x)*(((1+0)*x-(x+1)*1)/x^2))/sen((x+1)/x).

?- derivada((x^5+x^3)/(x^2+1), Y).
Y = ((5*x^4+3*x^2)*(x^2+1)-(x^5+x^3)*(2*x^1+0))/(x^2+1)^2.

?- derivada(arctan((x^2+1)^10), Y).
Y = 10*(x^2+1)^9*(2*x^1+0)/(1+((x^2+1)^10)^2).
```

La representación exacta puede variar por la precedencia de operadores al
mostrarse, pero conserva las reglas y los términos sin simplificación. Por
ejemplo, `3*1` queda indicado en la derivada de `3*x`.

Para ejecutar las pruebas: `swipl -q -s derivadas_tests.pl -g run_tests -t halt`.

## Reglas incluidas

- Suma y resta: derivación término a término.
- Producto y cociente: reglas del producto, del múltiplo constante y del cociente.
- Potencia numérica: regla de la potencia; para bases compuestas, regla de la cadena.
- `sen`, `cos`, `tan`, `arctan`, `exp` y `ln`: derivadas con regla de la cadena.

El código es una implementación original basada en las reglas habituales de
cálculo diferencial; no incorpora fragmentos de código de las referencias del
enunciado.
