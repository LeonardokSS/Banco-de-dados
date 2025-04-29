create database aulaTransacao
use aulaTransacao
create table contas(
Idconta INT primary key,
Saldo Decimal(10,2)
);
insert into Contas(Idconta, Saldo) Values (1, 1000.00);
insert into Contas(Idconta, Saldo) Values (2, 500.00);

Begin transaction; 
Update contas set Saldo = Saldo - 100 Where Idconta = 1;
Update contas set Saldo = Saldo + 200 Where Idconta = 2;

Rollback;
Commit;	

select*from contas