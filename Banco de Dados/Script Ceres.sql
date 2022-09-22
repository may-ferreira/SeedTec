create database Ceres;
use Ceres;

create table Empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
descricao varchar(60)
);

create table Usuario(
idUser int auto_increment,
nome varchar(45),
sobrenome varchar(45),
email varchar(60), constraint chkemail check (email like '%@%'),
senha varchar(30),
username varchar(45),
dtnasc date,
ddd char(2),
telefone varchar(9),
fkEmpresa int,
constraint fkempresa foreign key (fkEmpresa) references Empresa(idEmpresa),
primary key (idUser, fkEmpresa)
);

create table Especie(
idEspecie int primary key auto_increment,
nome varchar(45),
temp_min decimal,
temp_max decimal,
umi_min decimal,
umi_max decimal
);

create table Armazem(
idArmazem int,
estado char(2),
cidade varchar(45),
bairro varchar(45),
fkUser int,
fkEspecie int,
constraint chkestado check (estado in ('AC','AL','AP','AM','BA','CE','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO')),
constraint fkusuario foreign key (fkUser) references Usuario(idUser),
constraint fkespecie foreign key (fkEspecie) references Especie(idEspecie),
primary key (idArmazem, fkUser, fkEspecie)
);

create table Metrica(
idMetrica int,
horario datetime,
temperatura decimal,
umidade decimal,
fkArmazem int,
constraint fkarmazem foreign key (fkArmazem) references Armazem(idArmazem),
primary key (idMetrica, fkArmazem)
);