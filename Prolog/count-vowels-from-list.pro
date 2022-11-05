% Problema 3: 
% Escreva o predicado contaVogal(Lista, Contador)
% a quantidade de vogais em uma lista.
% 
% Por exemplo: 
% contaVogal([m,a,d,a,m],2) = true.

contaVogal([], N).
contaVogal([Head|Tail]) :- 
    Head =\= a, 
contaVogal(Tail).