--------------------------------------------------------------------------
--------------------------------------------------------------------------
----------------------------   TRIGGERS ----------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------


DROP TRIGGER if exists AnimalMorre;
create trigger AnimalMorre after update on Animal
for each row 
when (Animal.Condicao = 'morto')
begin
delete from Animal where idAnimal = old.idAnimal;
end;




DROP TRIGGER if exists TratarAnimal;
create trigger TratarAnimal after insert on DataTratamento
FOR EACH ROW
When Animal.idAnimal = DataTratamento.idAnimal AND Animal.idCondicao != 0
Begin
Update Animal
set idCondicao = (Select idCondicao from Animal
					where idCondicao = new.idCondicao)

Where idDataTratamento = new.idDataTratamento;
End;

