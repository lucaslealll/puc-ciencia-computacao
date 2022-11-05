-- RSA - Exercícios Programação Lua
-- LUCAS OMAR ANDRADE LEAL

-- Exercício 1

v = {6, -3, 700, 90, 10};

function MaxMin(vetor)
    local x = vetor[1]
    local y = vetor[1] 
    
    for i=1,#vetor,1 do
        if vetor[i] > x then
            x = vetor[i]
        elseif vetor[i] < y then
            y = vetor[i]
        end
    end
    
    return print("Max",x), print("Min",y)
end

MaxMin(v)
