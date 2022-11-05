% Problema 1:
% Escreva o predicado imprima(L) para imprimir
% na tela do computador os elementos de uma da lista L. 
% Por exemplo: imprima([3,5,1,3]). 3 5 1 3

% format = permite caracteres formatadores de saída
% ~w => escrita de um valor | ~n => pula linha

% Imprima recebe como argumento uma lista inicialmente vazia
% A recursividade irá "esvaziar a lista", logo precisamos do primeiro imprima.
% Ao receber [Head|Tail] como argumento, ele imprimirá o Head e então será passado
% Tail como argumento da lista para a próxima execução

% Exec 1: Head = 3 Tail = 5,1,3
% Exec 2: Head = 5 Tail = 1,3
% Exec 3: Head = 1 Tail = 3
% Exec 4: Head = 3 Tail = []

imprima([]).
imprima([Head|Tail]) :- 
    format('~w~n',Head),
    imprima(Tail).