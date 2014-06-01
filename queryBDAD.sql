--listagem de todos os animais e as suas informaçoes mais importantes
Select nome, nomeEspecie, genero, DataDeNascimento, Peso, nomeTratador
FROM Animal, Especie, Genero, Tratador
Where (Animal.idEspecie = Especie.idEspecie AND Animal.idGenero = Genero.idGenero AND
	Animal.idTratador = Tratador.idTratador)
GROUP BY Animal.nome
ORDER BY Animal.nome; 

--animais de uma determinada especie
--util no caso de se terem de fazer tratamentos a todos os animais daquela especie e/ou limpezas especificas
-- p.e., as cobras mudam de pele varias vezes ao ano (supondo que mudam na mesma epoca de acordo com a especie)
-- é importante fazer uma limpeza especifica a todos os animais daquela especie
Select nomeEspecie, Animal.nome
From Animal, Especie
Where Especie.idEspecie = Animal.idEspecie
ORDER BY Especie.nomeEspecie;

--especies de animais por jaula
--util no caso dos peixes,p.e., visto que podemos ter diferentes especies de peixes no mesmo aquario
Select Animal.idJaula, nomeEspecie 
From Jaula, Animal, Especie
Where Animal.idJaula = Jaula.idJaula AND Animal.idEspecie = Especie.idEspecie
ORDER BY Animal.idEspecie;

--especies de animais por zona
Select localizacao, nomeEspecie
FROM Localizacao, Especie, Animal, Jaula
Where (Especie.idEspecie = Animal.idEspecie AND Jaula.idLocalizacao = Localizacao.idLocalizacao AND Animal.idJaula = Jaula.idJaula)
ORDER BY Localizacao.localizacao;

--tipo de jaula por localizacao
Select DISTINCT localizacao, tipoJaula
From Localizacao, TipoDeJaula, Jaula
Where Localizacao.idLocalizacao = Jaula.idLocalizacao
ORDER BY Localizacao.idLocalizacao;

-- Lista de Funcionarios do Zoo
-- lista de todos os tratadores e veterinarios
Select nomeTratador AS Funcionarios
From Tratador
UNION
Select nomeVeterinario
From Veterinario;

--todos os veterinarios que estao a tratar um determinado animal
Select nomeVeterinario, nome, nomeCondicao
From Veterinario, Animal, Condicao, DataTratamento, Tratamento
Where (Condicao.nomeCondicao = 'em tratamento' AND
	DataTratamento.idCondicao = Condicao.idCondicao AND 
	DataTratamento.idTratamento = Tratamento.idTratamento AND
	Tratamento.idVeterinario = Veterinario.idVeterinario AND
	DataTratamento.idAnimal = Animal.idAnimal)
ORDER BY Veterinario.nomeVeterinario;


-- mostra os animais cuja condicao é diference de saudavel e ainda nao estao em tratamento
Select nome, nomeEspecie, nomeCondicao
From Animal, Condicao, Especie
Where Animal.idEspecie = Especie.idEspecie AND Animal.idCondicao = Condicao.idCondicao
GROUP BY Condicao.nomeCondicao
HAVING (Condicao.nomeCondicao != 'saudavel' AND Condicao.nomeCondicao != 'em tratamento' AND Condicao.nomeCondicao != 'morto');

--especie com mais tratamentos
Select nomeEspecie, count(*) AS n_trat
From Tratamento, Especie, DataTratamento, Animal
Where (Animal.idEspecie = Especie.idEspecie AND DataTratamento.idAnimal = Animal.idAnimal AND
	Tratamento.idTratamento = DataTratamento.idTratamento)
GROUP BY Especie.idEspecie
ORDER BY n_trat DESC
LIMIT 1;

-- peso médio por especie
Select nomeEspecie AS especie, avg (Peso) AS Pesomedio
From Animal, Especie
Where(Animal.idEspecie = Especie.idEspecie)
group by Animal.idEspecie;