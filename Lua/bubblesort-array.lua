-- RSA - Exercícios Programação Lua
-- Lucas

-- Exercício 2

v = {6, -3, 700, 90,1};

function BubbleSort(vet)
	aux = 0
	swpd = 0
		
    while swpd ~= 3 do
        for i=1, #vet-1, 1 do
            if vet[i] > vet[i+1] then
				aux      = vet[i]
				vet[i]   = vet[i+1]
				vet[i+1] = aux
			end			
        end
		swpd = swpd+1
	end
	return vet
end

function formata(vetor)
    for i=1, #vetor, 1 do
        if i == 1 then io.write("{") end
        io.write(vetor[i])
        if i < #vetor then io.write(", ") end
        if i == #vetor then io.write("}") end
    end
end
	

-- LIMPA CONSOLE
os.execute("cls"); os.execute("clear")

formata(v)
vet = BubbleSort(v) -- chama a função bubblesort
print("\nVetor ordenado:") -- salta linha
formata(vet)
	