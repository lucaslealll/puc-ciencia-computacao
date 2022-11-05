program Problema03;
uses crt;

type coluna = array[1..5] of integer; {define 5 colunas}
     matriz = array[1..5] of coluna;  {define 5 linhas do tipo coluna... cada coluna terá 5 linhas}
     rota   = array[1..7] of integer; {array que guarda a rota da pessoa}
    
var m: matriz;
    r: rota;
    aux, result, i, j: integer;

begin

    ClrScr; {limpa o console}

    {matriz proposta no exercicio}
    m[1,1] :=  0; m[1,2] := 15; m[1,3] := 30; m[1,4] :=  5; m[1,5] := 12;
    m[2,1] := 15; m[2,2] :=  0; m[2,3] := 10; m[2,4] := 17; m[2,5] := 28;
    m[3,1] := 30; m[3,2] := 10; m[3,3] :=  0; m[3,4] :=  3; m[3,5] := 11;
    m[4,1] :=  5; m[4,2] := 17; m[4,3] :=  3; m[4,4] :=  0; m[4,5] := 80;
    m[5,1] := 12; m[5,2] := 28; m[5,3] := 11; m[5,4] := 80; m[5,5] :=  0;

    {recebe dados do usuário -> guarda as rotas em um array}
    i:=1;
    while (i < 8) do 
    begin
        write(i, '° Rota >> ');
        readln(r[i]);
        i:=i+1;
    end;
      
    {conta

        1,2,3,4,5,1,4:
        15 + 10 + 3 + 80 + 12 + 5 = 125km
    
        r[1]+r[2] = 25
        r[2]+r[3] = 28
        r[3]+r[4] = 108
        r[4]+r[5] = 120
        r[6]+r[7] = 125
    }
    for j:=0 to 5 do 
        begin aux := aux + m[r[j+1],r[j+2]]; end;
    
    writeln('Resultado final ==== ', aux, 'km');   
end.


