--------------------------------------------------------------------------
--------------------------------------------------------------------------
----------------------------   TRIGGERS ----------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------

Create trigger TratarAnimal
Before insert into DataTratamento
for each row
When (Animal.idAnimal = DataTratamento.idAnimal AND Animal.idCondicao != 0)
Begin
Update Animal
set Animal.idCondicao = 1
Where old.idCondicao=new.idCondicao
End