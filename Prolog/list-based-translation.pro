% Problema 4:
% Defina a relação traduza(Lista1, Lista2) para traduzir
% uma lista de números entre 0 e 9 para uma lista de
% palavras correspondentes.
% 
% Por exemplo:
% traduza([3,5,1,3], [tres, cinco, um, tres]).

% palavras([zero,um,dois,tres,quatro,cinco,seis,sete,oito,nove]).
% numeros([0,1,2,3,4,5,6,7,8,9]).

% ? - traduza([1,9,0,$, ola],[um,nove,zero,casa,carneiro]).
traduza([Head|Tail], [Head2|Tail2]) :- 
    Head = 0, Head2 = zero,	  format('zero ');
    Head = 1, Head2 = um, 	  format('um ');
    Head = 2, Head2 = dois,   format('dois ');
    Head = 3, Head2 = tres,	  format('tres ');
    Head = 4, Head2 = quatro, format('quatro ');
    Head = 5, Head2 = cinco,  format('cinco ');
    Head = 6, Head2 = seis,   format('seis ');
    Head = 7, Head2 = sete,   format('sete ');
    Head = 8, Head2 = oito,   format('oito ');
    Head = 9, Head2 = nove,   format('nove ');
traduza(Tail,Tail2).

% ? - traduza2([4,0,0,2,8,9,2,2])
traduza2([Head|Tail]) :- 
    Head = 0, format('zero ');
    Head = 1, format('um ');
    Head = 2, format('dois ');
    Head = 3, format('tres ');
    Head = 4, format('quatro ');
    Head = 5, format('cinco ');
    Head = 6, format('seis ');
    Head = 7, format('sete ');
    Head = 8, format('oito ');
    Head = 9, format('nove ');
traduza2(Tail).