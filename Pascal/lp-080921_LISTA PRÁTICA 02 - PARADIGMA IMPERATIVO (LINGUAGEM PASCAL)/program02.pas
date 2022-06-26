// CABEÇALHO DO PROGRAMA Program nome;
// crt É UMA BIBLIOTECA QUE FORNECE SUBROTINAS PARA A LINGUAGEM
Program p2;
Uses crt;

// DECLARAÇÃO DE VARIÁVEIS E TIPAGEM
var a, c, soma: integer;
n, k, media, x, y, total: real;
cod, sim, teste: boolean;
cor: string;

// INÍCIO DO PROGRAMA PRINCIPAL
begin
    // ATRIBUIÇÃO DE VALORES E OPERAÇÕES
    k := 1;
    cor := 'verde';
    teste := FALSE;
    n := 5;
    x := 37;
    y := 3;
    soma := 30;

    // n:a:b
    // -n é a variável ou expressão a formatar
    // -a número de casas à esquerda
    // -b número de casas à direita
    
    // SAÍDA DE RESULTADOS
    media := soma/n;
        writeln('30/5           = ', media:0:2);
    cod := sqr(n) + 1 >= 5; {sqr = potência quadrada}
        writeln('(5²) + 1 >= 5  ? ', cod);
    sim := (x=0) and (y <> 2);
        writeln('(x=0) e (y<>2) ? ', sim);
    total := sqrt(n) + sqr(x) + y; {sqrt = raiz quadrada}
        writeln('√5 + x² + 3    = ', total:0:2);
    n := x/y;
        writeln('37/3           = ', n:0:2);
end.