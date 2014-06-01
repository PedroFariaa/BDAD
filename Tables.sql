.mode columns
.headers on
.nullvalue NULL
pragma foreign_key=on;

drop table if exists Animal;
create table Animal(idAnimal integer PRIMARY KEY, Nome text, DataDeNascimento text, Peso integer, idEspecie text REFERENCES Especie(idEspecie), idGenero text REFERENCES Genero(idGenero), idJaula integer REFERENCES Jaula(idJaula), idCondicao text REFERENCES Condicao(idCondicao), idTratador integer REFERENCES Tratador(idTratador));

drop table if exists Especie;
create table Especie(idEspecie integer PRIMARY KEY, NomeEspecie text);

drop table if exists Genero;
create table Genero(idGenero integer PRIMARY KEY, Genero text);

drop table if exists Jaula;
create table Jaula(idJaula integer PRIMARY KEY, area integer, idLocalizacao text REFERENCES Localizacao(idLocalizacao), idTipoJaula text REFERENCES TipoDeJaula(idTipoJaula), idLimpeza integer REFERENCES Limpeza(idLimpeza));

drop table if exists TipoDeJaula;
create table TipoDeJaula(idTipoJaula integer PRIMARY KEY, tipoJaula text);

drop table if exists Localizacao;
create table Localizacao(idLocalizacao integer PRIMARY KEY, localizacao text);

drop table if exists Limpeza;
create table Limpeza(idLimpeza integer PRIMARY KEY, nomeLimpeza text, idTratador integer REFERENCES Tratador(idTratador), nomeMaterialLimpeza text REFERENCES MaterialLimpeza(nomeMaterialLimpeza));

drop table if exists DataLimpeza;
create table DataLimpeza(idDataLimpeza integer PRIMARY KEY, dataLimpeza text, idJaula integer REFERENCES Jaula(idJaula), idLimpeza integer REFERENCES Limpeza(idLimpeza));

drop table if exists MaterialDeLimpeza;
create table MaterialDeLimpeza(idMaterialLimpeza integer PRIMARY KEY, nomeMaterialLimpeza text);

drop table if exists QuantMaterialLimpeza;
create table QuantMaterialLimpeza(idQuantMaterialLimpeza integer PRIMARY KEY, quantMaterialLimpeza integer, idLimpeza integer REFERENCES Limpeza(idLimpeza), idMaterialLimpeza integer REFERENCES MaterialdeLimpeza(idMaterialLimpeza));

drop table if exists Tratador;
create table Tratador(idTratador integer PRIMARY KEY, nomeTratador text, turnoTratador text);

drop table if exists Veterinario;
create table Veterinario(idVeterinario integer PRIMARY KEY, nomeVeterinario text, turnoVeterinario text);

drop table if exists Condicao;
create table Condicao(idCondicao integer PRIMARY KEY, nomeCondicao text);

drop table if exists Tratamento;
create table Tratamento(idTratamento integer PRIMARY KEY, idVeterinario integer REFERENCES Veterinario(idVeterinario));

drop table if exists DataTratamento;
create table DataTratamento(idTratamento integer REFERENCES Tratamento(idTratamento), idCondicao integer REFERENCES Condicao(idCondicao), idAnimal integer REFERENCES Animal(idAnimal), data text, PRIMARY KEY(idTratamento, idCondicao, idAnimal));

drop table if exists Medicamento;
create table Medicamento(idMedicamento integer PRIMARY KEY, nomeMedicamento text, componentesMedicamento text);

drop table if exists Dosagem;
create table Dosagem(idDosagem integer PRIMARY KEY, dose integer, tempoDeAplicação integer, idMedicamento integer REFERENCES Medicamento(idMedicamento), idTratamento integer REFERENCES Tratamento(idTratamento));

drop table if exists MaterialTratamento;
create table MaterialTratamento(idMaterialTratamento integer PRIMARY KEY, nomeMaterialTratamento text, idTratamento integer REFERENCES Tratamento(idTratamento));

drop table if exists QuantidadeMaterialTratamento;
create table QuantidadeMaterialTratamento(idQuantidadeMaterialTratamento integer PRIMARY KEY, quantidadeMaterialTratamento integer, idTratamento integer REFERENCES Tratamento(idTratamento), idMaterialTratamento integer REFERENCES MaterialTratamento(idMaterialTratamento));


-----------------------------------------------------------------------------------------
--------------------------------preencher tabelas com dados------------------------------
----------------------------------------------------------------------------------------- 

insert into Especie(idEspecie, NomeEspecie) values(1, 'Peixe-Palhaco');
insert into Especie(idEspecie, NomeEspecie) values(2, 'Babuino-anubis');
insert into Especie(idEspecie, NomeEspecie) values(3, 'Bufalo-africano');
insert into Especie(idEspecie, NomeEspecie) values(4, 'Adax');
insert into Especie(idEspecie, NomeEspecie) values(5, 'Leopardo');
insert into Especie(idEspecie, NomeEspecie) values(6, 'Okapi');
insert into Especie(idEspecie, NomeEspecie) values(7, 'Canguru-de-bennett');
insert into Especie(idEspecie, NomeEspecie) values(8, 'Chimpanze');
insert into Especie(idEspecie, NomeEspecie) values(9, 'Elefante-africano');
insert into Especie(idEspecie, NomeEspecie) values(10, 'Chita');
insert into Especie(idEspecie, NomeEspecie) values(11, 'Foca-comum');
insert into Especie(idEspecie, NomeEspecie) values(12, 'Gibao-de-maos-brancas');
insert into Especie(idEspecie, NomeEspecie) values(13, 'Girafa-de-angola');
insert into Especie(idEspecie, NomeEspecie) values(14, 'Hipopótamo');
insert into Especie(idEspecie, NomeEspecie) values(15, 'Jaguar');
insert into Especie(idEspecie, NomeEspecie) values(16, 'Koala');
insert into Especie(idEspecie, NomeEspecie) values(17, 'Leão-africano');
insert into Especie(idEspecie, NomeEspecie) values(18, 'Leão-marinho-da-california');
insert into Especie(idEspecie, NomeEspecie) values(19, 'Arara-nanica');
insert into Especie(idEspecie, NomeEspecie) values(20, 'Cassuar');
insert into Especie(idEspecie, NomeEspecie) values(21, 'Caturra');
insert into Especie(idEspecie, NomeEspecie) values(22, 'Flamingo-rubro');
insert into Especie(idEspecie, NomeEspecie) values(23, 'Cisne-negro');
insert into Especie(idEspecie, NomeEspecie) values(24, 'Grou-do-japao');
insert into Especie(idEspecie, NomeEspecie) values(25, 'Lorio-reticulado');
insert into Especie(idEspecie, NomeEspecie) values(26, 'Turaco-violeta');
insert into Especie(idEspecie, NomeEspecie) values(27, 'Pato-mandarim');
insert into Especie(idEspecie, NomeEspecie) values(28, 'Aligator-americano');
insert into Especie(idEspecie, NomeEspecie) values(29, 'Boa-da-jamaica');
insert into Especie(idEspecie, NomeEspecie) values(30, 'Crocodilo-do-nilo');
insert into Especie(idEspecie, NomeEspecie) values(31, 'Iguana-verde');
insert into Especie(idEspecie, NomeEspecie) values(32, 'Pitao-da-birmania');
insert into Especie(idEspecie, NomeEspecie) values(33, 'Tartaruga-alongada');
insert into Especie(idEspecie, NomeEspecie) values(34, 'Tartaruga-grega');
insert into Especie(idEspecie, NomeEspecie) values(35, 'Varano-do-nilo');
insert into Especie(idEspecie, NomeEspecie) values(36, 'Chuckwalla');


insert into Genero(idGenero, genero) values(1, 'M');
insert into Genero(idGenero, genero) values(2, 'F');

insert into Jaula(idJaula, area, idLocalizacao, idTipoJaula, idLimpeza) values(1,1.5, 4, 'Aquario',1);
insert into Jaula(idJaula, area, idLocalizacao, idTipoJaula, idLimpeza) values(2,50, 3,'Terrario',2);
insert into Jaula(idJaula, area, idLocalizacao, idTipoJaula, idLimpeza) values(3,10, 2,'Aviario',2);
insert into Jaula(idJaula, area, idLocalizacao, idTipoJaula, idLimpeza) values(4,40, 1,'Terrario',2);
insert into Jaula(idJaula, area, idLocalizacao, idTipoJaula, idLimpeza) values(5,6.5, 1,'Gelo',3);
insert into Jaula(idJaula, area, idLocalizacao, idTipoJaula, idLimpeza) values(6,8, 3,'Aquario',1);
insert into Jaula(idJaula, area, idLocalizacao, idTipoJaula, idLimpeza) values(7,25, 4,'Gelo',3);
insert into Jaula(idJaula, area, idLocalizacao, idTipoJaula, idLimpeza) values(8,40, 4,'Savana',2);
insert into Jaula(idJaula, area, idLocalizacao, idTipoJaula, idLimpeza) values(9,100, 2,'Savana',2);

insert into TipoDeJaula(idTipoJaula, tipoJaula) values(1, 'Aquario');
insert into TipoDeJaula(idTipoJaula, tipoJaula) values(2, 'Terrario');
insert into TipoDeJaula(idTipoJaula, tipoJaula) values(3, 'Gelo');
insert into TipoDeJaula(idTipoJaula, tipoJaula) values(4, 'Savana');
insert into TipoDeJaula(idTipoJaula, tipoJaula) values(5, 'Aviario');

insert into Localizacao(idLocalizacao, localizacao) values(1, 'Norte');
insert into Localizacao(idLocalizacao, localizacao) values(2, 'Sul');
insert into Localizacao(idLocalizacao, localizacao) values(3, 'Este');
insert into Localizacao(idLocalizacao, localizacao) values(4, 'Oeste');

insert into Limpeza(idLimpeza, nomeLimpeza, idTratador,nomeMaterialLimpeza) values(1,'Algas',1,'Espatula');
insert into Limpeza(idLimpeza, nomeLimpeza, idTratador,nomeMaterialLimpeza) values(2,'Folhas',2,'Vassoura');
insert into Limpeza(idLimpeza, nomeLimpeza, idTratador,nomeMaterialLimpeza) values(3,'Agua-Contaminada',3,'Filtro-e-Descontaminante');

insert into DataLimpeza(idJaula, idLimpeza,dataLimpeza) values(1,1,'20out2012');
insert into DataLimpeza(idJaula, idLimpeza,dataLimpeza) values(2,2,'5out2012');
insert into DataLimpeza(idJaula, idLimpeza,dataLimpeza) values(3,2,'16nov2012');
insert into DataLimpeza(idJaula, idLimpeza,dataLimpeza) values(4,2,'16nov2012');
insert into DataLimpeza(idJaula, idLimpeza,dataLimpeza) values(5,3,'8dez2012');
insert into DataLimpeza(idJaula, idLimpeza,dataLimpeza) values(6,1,'21dez2012');
insert into DataLimpeza(idJaula, idLimpeza,dataLimpeza) values(7,3,'5jan2013');
insert into DataLimpeza(idJaula, idLimpeza,dataLimpeza) values(6,1,'10jan2013');
insert into DataLimpeza(idJaula, idLimpeza,dataLimpeza) values(5,3,'2fev2013');
insert into DataLimpeza(idJaula, idLimpeza,dataLimpeza) values(1,2,'15fev2013');

insert into MaterialDeLimpeza(idMaterialLimpeza, nomeMaterialLimpeza) values(1, 'Espatula');
insert into MaterialDeLimpeza(idMaterialLimpeza, nomeMaterialLimpeza) values(2, 'Vassoura');
insert into MaterialDeLimpeza(idMaterialLimpeza, nomeMaterialLimpeza) values(3, 'Filtro-e-Descontaminante');
insert into MaterialDeLimpeza(idMaterialLimpeza, nomeMaterialLimpeza) values(4, 'Mangueira');
insert into MaterialDeLimpeza(idMaterialLimpeza, nomeMaterialLimpeza) values(5, 'Aspirador');

insert into QuantMaterialLimpeza(idQuantMaterialLimpeza, quantMaterialLimpeza, idLimpeza, idMaterialLimpeza)
									values(1, 1, 1, 1);
insert into QuantMaterialLimpeza(idQuantMaterialLimpeza, quantMaterialLimpeza, idLimpeza, idMaterialLimpeza)
									values(2, 3, 2, 2);
insert into QuantMaterialLimpeza(idQuantMaterialLimpeza, quantMaterialLimpeza, idLimpeza, idMaterialLimpeza)
									values(3, 2, 3, 3);

insert into Condicao(idCondicao, nomeCondicao) values(0, 'saudavel');
insert into Condicao(idCondicao, nomeCondicao) values(1, 'em tratamento');
insert into Condicao(idCondicao, nomeCondicao) values(2, 'morto');
insert into Condicao(idCondicao, nomeCondicao) values(3, 'envenenamento');
insert into Condicao(idCondicao, nomeCondicao) values(4, 'pata-partida');
insert into Condicao(idCondicao, nomeCondicao) values(5, 'infeccao-pos-parto');


insert into Tratador(idTratador, nomeTratador, turnoTratador) values(1, 'Jorge', 'manha');
insert into Tratador(idTratador, nomeTratador, turnoTratador) values(2, 'Sofia', 'manha');
insert into Tratador(idTratador, nomeTratador, turnoTratador) values(3, 'Margarida', 'noite');
insert into Tratador(idTratador, nomeTratador, turnoTratador) values(4, 'Daniel', 'tarde');
insert into Tratador(idTratador, nomeTratador, turnoTratador) values(5, 'Joana', 'noite');
insert into Tratador(idTratador, nomeTratador, turnoTratador) values(6, 'Miguel', 'tarde');

insert into Animal(idAnimal, Nome, DataDeNascimento, idEspecie, idGenero, idJaula, idCondicao, idTratador, Peso)
					values(1, 'Simba', '5ago2010', 17, 1, 8, 0, 1, 400);
insert into Animal(idAnimal, Nome, DataDeNascimento, idEspecie, idGenero, idJaula, idCondicao, idTratador, Peso)
					values(2, 'Nemo', '4jul2004', 1, 2, 1, 0, 3, 0.1);
insert into Animal(idAnimal, Nome, DataDeNascimento, idEspecie, idGenero, idJaula, idCondicao, idTratador, Peso)
					values(3, 'Xana', '22abr2002', 9, 2, 9, 2, 2, 2000);
insert into Animal(idAnimal, Nome, DataDeNascimento, idEspecie, idGenero, idJaula, idCondicao, idTratador, Peso)
					values(4, 'Tibas', '27mai2014', 9, 1, 9, 0, 2, 2500);
insert into Animal(idAnimal, Nome, DataDeNascimento, idEspecie, idGenero, idJaula, idCondicao, idTratador, Peso)
					values(5, 'Dragoa', '19set2009', 31, 2, 2, 1, 5, 1.8);
insert into Animal(idAnimal, Nome, DataDeNascimento, idEspecie, idGenero, idJaula, idCondicao, idTratador, Peso)
					values(6, 'Penas', '8mar2011', 19, 1, 3, 0, 6, 0.350);


insert into Veterinario(idVeterinario, nomeVeterinario, turnoVeterinario)
						values(1, 'João', 'manha');
insert into Veterinario(idVeterinario, nomeVeterinario, turnoVeterinario)
						values(2, 'Francisca', 'tarde');
insert into Veterinario(idVeterinario, nomeVeterinario, turnoVeterinario)
						values(3, 'Tiago', 'noite');
insert into Veterinario(idVeterinario, nomeVeterinario, turnoVeterinario)
						values(4, 'Rute', 'tarde');


insert into Tratamento(idTratamento, idVeterinario) values(1, 1);
insert into Tratamento(idTratamento, idVeterinario) values(2, 2);
insert into Tratamento(idTratamento, idVeterinario) values(3, 3);
insert into Tratamento(idTratamento, idVeterinario) values(4, 2);
insert into Tratamento(idTratamento, idVeterinario) values(5, 3);
insert into Tratamento(idTratamento, idVeterinario) values(6, 4);
insert into Tratamento(idTratamento, idVeterinario) values(7, 1);


insert into DataTratamento(idTratamento, idCondicao, idAnimal, data) values(1, 2, 5, '2Nov2012');
insert into DataTratamento(idTratamento, idCondicao, idAnimal, data) values(2, 1, 5, '18Nov2010');
insert into DataTratamento(idTratamento, idCondicao, idAnimal, data) values(1, 1, 3, '1Jun2014');

insert into Medicamento(idMedicamento, nomeMedicamento, componentesMedicamento)
						values(1, '', '');
insert into Medicamento(idMedicamento, nomeMedicamento, componentesMedicamento)
						values(2, '', '');
insert into Medicamento(idMedicamento, nomeMedicamento, componentesMedicamento)
						values(3, '', '');
insert into Medicamento(idMedicamento, nomeMedicamento, componentesMedicamento)
						values(4, '', '');
insert into Medicamento(idMedicamento, nomeMedicamento, componentesMedicamento)
						values(5, '', '');
insert into Medicamento(idMedicamento, nomeMedicamento, componentesMedicamento)
						values(6, '', '');


insert into Dosagem(idDosagem, dose, tempoDeAplicação, idMedicamento, idTratamento) values(1, 5, 10, 2, 5);
insert into Dosagem(idDosagem, dose, tempoDeAplicação, idMedicamento, idTratamento) values(2, 1, 30, 1, 1);
insert into Dosagem(idDosagem, dose, tempoDeAplicação, idMedicamento, idTratamento) values(3, 30, 12, 5, 4);
insert into Dosagem(idDosagem, dose, tempoDeAplicação, idMedicamento, idTratamento) values(4, 200, 1, 2, 3);
insert into Dosagem(idDosagem, dose, tempoDeAplicação, idMedicamento, idTratamento) values(5, 8, 60, 4, 4);
insert into Dosagem(idDosagem, dose, tempoDeAplicação, idMedicamento, idTratamento) values(6, 6, 2, 2, 6);
insert into Dosagem(idDosagem, dose, tempoDeAplicação, idMedicamento, idTratamento) values(7, 132, 1, 6, 7);


insert into MaterialTratamento(idMaterialTratamento, nomeMaterialTratamento, idTratamento) values(1, 'Seringa', 2);
insert into MaterialTratamento(idMaterialTratamento, nomeMaterialTratamento, idTratamento) values(2, 'Compressa', 2);
insert into MaterialTratamento(idMaterialTratamento, nomeMaterialTratamento, idTratamento) values(3, 'Bisturi', 2);
insert into MaterialTratamento(idMaterialTratamento, nomeMaterialTratamento, idTratamento) values(4, 'Cama-cirurgia', 2);
insert into MaterialTratamento(idMaterialTratamento, nomeMaterialTratamento, idTratamento) values(5, 'Liga', 4);
insert into MaterialTratamento(idMaterialTratamento, nomeMaterialTratamento, idTratamento) values(6, 'Tala', 5);
insert into MaterialTratamento(idMaterialTratamento, nomeMaterialTratamento, idTratamento) values(7, 'Maquina-Ultrassom', 3);
insert into MaterialTratamento(idMaterialTratamento, nomeMaterialTratamento, idTratamento) values(8, 'Tesoura', 5);
insert into MaterialTratamento(idMaterialTratamento, nomeMaterialTratamento, idTratamento) values(9, 'Maquina-ecografia', 7);


insert into QuantidadeMaterialTratamento(idQuantidadeMaterialTratamento, quantidadeMaterialTratamento, idTratamento, idMaterialTratamento)
								values(1, 3, 2, 2);
insert into QuantidadeMaterialTratamento(idQuantidadeMaterialTratamento, quantidadeMaterialTratamento, idTratamento, idMaterialTratamento)
								values(2, 1, 7, 3);
insert into QuantidadeMaterialTratamento(idQuantidadeMaterialTratamento, quantidadeMaterialTratamento, idTratamento, idMaterialTratamento)
								values(3, 3, 3, 2);
insert into QuantidadeMaterialTratamento(idQuantidadeMaterialTratamento, quantidadeMaterialTratamento, idTratamento, idMaterialTratamento)
								values(4, 8, 5, 4);
insert into QuantidadeMaterialTratamento(idQuantidadeMaterialTratamento, quantidadeMaterialTratamento, idTratamento, idMaterialTratamento)
								values(5, 2, 8, 5);
insert into QuantidadeMaterialTratamento(idQuantidadeMaterialTratamento, quantidadeMaterialTratamento, idTratamento, idMaterialTratamento)
								values(6, 1, 4, 2);
insert into QuantidadeMaterialTratamento(idQuantidadeMaterialTratamento, quantidadeMaterialTratamento, idTratamento, idMaterialTratamento)
								values(7, 2, 1, 2);
