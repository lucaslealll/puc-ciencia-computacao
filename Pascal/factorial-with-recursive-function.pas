{Problema 4
Escreva uma função recursiva em Pascal para calcular o fatorial de um número.}

program Problema04;
uses crt;

var x, i, fat: integer;

    function CalcFat(num: integer): integer;
        begin 
            fat := 1;
            for i := 1 to num do fat := fat * i;
            CalcFat := fat;
        end;

begin
    writeln('Calcula fatorial');
    writeln('Digite um valor inteiro para "X"');
        readln (x);

    writeln(x,'! = ', CalcFat(x));
end.
