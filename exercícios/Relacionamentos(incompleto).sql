create database Teste
use Teste 

create table Veiculos(
placa char(7) primary key,
Marca varchar(20),
Modelo VARCHAR(50),
Cor varchar(10)
);


create table Multas(
idMulta int primary key,
nomeMulta varchar (40),
valor float not null
);

CREATE TABLE atuacao (
    placaVeiculo CHAR(7),
    idMulta INT NOT NULL,
    Dia DATE,
    localDaMulta VARCHAR(60),
    CONSTRAINT fk_atuacao_Veiculos FOREIGN KEY (placaVeiculo)
        REFERENCES Veiculos(placa)
);


insert into Veiculos (placa,Marca,Modelo,Cor)
values ('TTTEEE','Toyota','Corolla','Preto');

insert into Veiculos(placa,Marca,Modelo,Cor)
values ('XXEEE','Fiat','Uno','Verde');
select *  from Veiculos




