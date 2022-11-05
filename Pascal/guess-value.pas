// CABEÇALHO DO PROGRAMA Program nome;
// crt É UMA BIBLIOTECA QUE FORNECE SUBROTINAS PARA A LINGUAGEM
Program p1;
Uses crt;

// DECLARAÇÃO DE VARIÁVEIS E TIPAGEM
var a, b, c: integer;
adivinha: real;

// INÍCIO DO PROGRAMA PRINCIPAL
begin

    writeln('>> ((a*5) + (b*3) + (c*2)) / 10');

    writeln('Digite 3 valores'); // PRINTA NO CONSOLE
        readln(a); // LÊ ENTRADA DO TECLADO
        readln(b);
        readln(c);
    
    adivinha := ((a*5)+(b*3)+(c*2))/10;
    
    // n:a:b
    // -n é a variável ou expressão a formatar
    // -a número de casas à esquerda
    // -b número de casas à direita
    writeln('a:',a,'; b:',b, '; c:',c);
    writeln('Resultado: ', adivinha:0:3);
end.