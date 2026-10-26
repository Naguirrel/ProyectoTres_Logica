# 15 ejemplos para `derivada/2`

Carga el programa desde la carpeta del proyecto con `swipl -s derivadas.pl`.
Después copia cada consulta que empieza con `?-`. Las respuestas se obtuvieron
con SWI-Prolog 10.0.2 y conservan las expresiones sin simplificar, como pide
el enunciado.

## 1. Logaritmo de un cociente

```prolog
?- derivada(ln(x/(x+1)), Y).
Y = (1*(x+1)-x*(1+0))/(x+1)^2/(x/(x+1)).
```

## 2. Seno de una exponencial

```prolog
?- derivada(sen(exp(3*x)), Y).
Y = cos(exp(3*x))*(exp(3*x)*(3*1)).
```

## 3. Logaritmo de un seno compuesto

```prolog
?- derivada(ln(sen((x+1)/x)), Y).
Y = cos((x+1)/x)*(((1+0)*x-(x+1)*1)/x^2)/sen((x+1)/x).
```

## 4. Cociente de polinomios

```prolog
?- derivada((x^5+x^3)/(x^2+1), Y).
Y = ((5*x^4+3*x^2)*(x^2+1)-(x^5+x^3)*(2*x^1+0))/(x^2+1)^2.
```

## 5. Arcotangente de una potencia compuesta

```prolog
?- derivada(arctan((x^2+1)^10), Y).
Y = 10*(x^2+1)^9*(2*x^1+0)/(1+((x^2+1)^10)^2).
```

## 6. Polinomio con suma y resta

```prolog
?- derivada(x^4+2*x^2-7, Y).
Y = 4*x^3+2*(2*x^1)-0.
```

## 7. Resta de potencias

```prolog
?- derivada(x^3-x, Y).
Y = 3*x^2-1.
```

## 8. Producto de `x` y seno

```prolog
?- derivada(x*sen(x), Y).
Y = 1*sen(x)+x*(cos(x)*1).
```

## 9. Coseno de un polinomio

```prolog
?- derivada(cos(x^2+1), Y).
Y = -sen(x^2+1)*(2*x^1+0).
```

## 10. Tangente con regla de la cadena

```prolog
?- derivada(tan(2*x), Y).
Y = 2*1/cos(2*x)^2.
```

## 11. Exponencial de una potencia

```prolog
?- derivada(exp(x^2), Y).
Y = exp(x^2)*(2*x^1).
```

## 12. Logaritmo de un polinomio

```prolog
?- derivada(ln(x^2+1), Y).
Y = (2*x^1+0)/(x^2+1).
```

## 13. Seno de una potencia

```prolog
?- derivada(sen(x^3), Y).
Y = cos(x^3)*(3*x^2).
```

## 14. Coseno de una exponencial

```prolog
?- derivada(cos(exp(x)), Y).
Y = -sen(exp(x))*(exp(x)*1).
```

## 15. Producto de dos polinomios

```prolog
?- derivada((x^2+1)*(x-2), Y).
Y = (2*x^1+0)*(x-2)+(x^2+1)*(1-0).
```
