program Programa_01;
uses crt;

var i, b, e, res: integer;

{FUNCTION PAUSE}
function pause():boolean; begin
    while (not keypressed) do 
        begin {ESPERA!} end;
end;

{MAIN}
begin
    i := 0; res := 1;

    writeln('Digite um valor para "b"'); readln(b);
    writeln('Digite um valor para "e"'); readln(e);
        
    while (i < e) do
        begin
            res := res * b;
            i := i + 1;
        end;
        
    writeln('O resultado eh = ', res);
    pause();
end.

