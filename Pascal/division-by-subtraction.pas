{*
Problema 2
Elabore um programa que calcule uma divisão entre dois números inteiros 
e positivos utilizando uma sequência de subtracões. Deve-se considerar que o primeiro
número (N1) será sempre maior que osegundo (N2), e que a divisão produz resultados exatos.
Por exemplo: N1=10, N2=2, Resultado 5.
*}

program Problema_02;
uses crt;

var a, b, quociente, dividendo, fracao: real;
    resto: double;

{MAIN}
begin
    ClrScr; {LIMPA O CONSOLE}

    writeln('X = a/b');
    writeln('Digite um valor para "a"'); readln(a);
    writeln('Digite um valor para "b"'); readln(b);

    fracao := a/b; resto := FRAC(fracao);
    quociente := 0; dividendo := a;
    
    if ((a > b) and (resto = 0)) then
        begin
            while (dividendo <> 0) do
            begin
                dividendo := dividendo - b;
                quociente := quociente + 1;
            end;
            writeln('O resultado eh = ', quociente:0:2);
        end
    else
        if (resto <> 0) then writeln('A conta nao produz resto "0"');
        if (a < b) then writeln('Atenção! "a" deve ser MAIOR que "b"');
end.

