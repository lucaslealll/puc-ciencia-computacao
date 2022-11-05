**Problema 1:** Elabore na linguagem Java códigos que atendam aos seguintes requisitos:

- [x] (a) Escreva a classe Sobremesa com `gets` e `sets` para os atributos nome e calorias
(que devem ser privados). O construtor dessa classe deverá receber como parâmetros `nome`
e `calorias`.

- [x] (b) Defina as operações de instância `ehSaudavel`, que retorna `true`, se e somente se,
a sobremesa tem menos de 200 calorias, e `ehDeliciosa`, que retorna `true` para todas as
sobremesas.

- [x] (c) Crie a classe `GeleiaEmCompota` que herdará da classe `Sobremesa`. O seu
construtor deverá aceitar um único argumento denominado `sabor`; a sua quantidade padrão
de calorias é 5 e seu nome deverá ser precedido de _"Geléia em Compota de "_, por exemplo,
_"Geléia em Compota de Morango"_.

- [x] (d) Inclua métodos `get` e `set` para o atributo sabor.

- [ ] (e) Modifique a operação `ehDeliciosa` (overriding) para retornar false se o `sabor` é
alcaçuz e true para todos os outros sabores. O comportamento dessa operação para
sobremesas que não são geléias em compotas não devem ser alterados.

- [ ] (f) No `main`, instancie objetos de ambas as classes e chame cada um dos métodos.