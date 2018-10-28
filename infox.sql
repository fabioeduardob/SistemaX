-- comentários
-- a linha abaixo cria um banco de dados
create database dbinfox;
-- a linha abaixo escolhe o banco de dados
use dbinfox;
-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
-- o comando abaixo descreve a tabela
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- create --> insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'Fábio Edircio','99999-9999','fabioedircio','123456');
-- a linha abaixo exibe os dados da tabela (CRUD)
-- read --> select
select * from tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'Administrador','99999-9999','admin','admin');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Bill Gates','99999-9999','bill','123456');

-- a linha abaixo modifica dados na tabela (CRUD)
-- update --> update
update tbusuarios set fone='88888-8888' where iduser=2;

-- a linha abaixo apaga um registro da tabela (CRUD)
-- delete --> delete
delete from tbusuarios where iduser=3;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values('João Pestana','Rua Duel Links, 2018','99999-9999','joaopestana@windows.com');

select * from tbclientes;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos(equipamento,defeito,servico,tecnico,valor,idcli)
values('Notebook','Não liga','Troca da fonte','Fábio',87.50,1);

select * from tbos;

-- o código abaixo traz informações de duas tabelas
select
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);

select * from tbusuarios;

describe tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Gizele Palhares','2222-2222','gigi_palhares','123456');

-- a linha abaixo adiciona um campo a tabela
alter table tbusuarios add column perfil varchar(20) not null;

-- a linha abaixo remove um campo de uma tabela
-- alter table tbusuarios drop column perfil;

update tbusuarios set perfil='admin' where iduser=1;
update tbusuarios set perfil='admin' where iduser=2;
update tbusuarios set perfil='user' where iduser=3;

update tbusuarios set fone='21969399756' where iduser=1;
update tbusuarios set fone='21968144299' where iduser=2;
update tbusuarios set fone='21999778888' where iduser=3;

alter table tbusuarios modify column login varchar(20) not null unique;

-- A linha abaixo altera a tabela adicionando um campo em uma determinada posição
alter table tbos add tipo varchar(15) not null after data_os;
alter table tbos add situacao varchar(20) not null after tipo;
describe tbos;