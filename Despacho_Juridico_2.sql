create database juzgado;
use juzgado;
drop database juzgado;
######################################
select *from  Administrador;
drop table Administrador;
create table Administrador
(id_admin INT AUTO_INCREMENT PRIMARY KEY,
nombre_admin varchar(35),
cargo varchar (35),	
correo_electronico varchar (35),
telefono double,
estado varchar (15),
contra varchar(20))
engine=InnoDB;

INSERT INTO Administrador (nombre_admin, cargo, correo_electronico, telefono, estado, contra) 
  values ('Elias Antonio Aguilar Romero', 'admin', 'eliasantny@hotmail.com', 7721146887, 'Hidalgo',  '1234');


drop table Posible_cliente;
create table Posible_cliente
(id_pCli int (4) unsigned not null primary key, 
nombre_completo varchar (50),
correo varchar (20),
telefono double,
asunto varchar (30),
mensaje varchar (300),
id_admin int auto_increment,
foreign key (id_admin) references Administrador (id_admin))
engine=InnoDB;

drop table Comprar;
create table Comprar
(id_comprar int (4) unsigned not null primary key,
precio float (30),
tipo varchar (4),
id_cont int auto_increment, FOREIGN KEY (id_cont) REFERENCES CONTACTO_CLIENTE (id_cont),
id_pCli int (2) unsigned not null, FOREIGN KEY (id_pCli) REFERENCES Posible_cliente (id_pCli))
engine=InnoDB;

######################################
select * from CONTACTO_CLIENTE;
drop table CONTACTO_CLIENTE;
create table CONTACTO_CLIENTE
(id_cont INT AUTO_INCREMENT PRIMARY KEY,
nombre_contacto varchar (40),
correo varchar (30),
telefono double,
estado varchar (30),
municipio varchar (30),
asunto varchar (30),
mensaje varchar (200))
engine=InnoDB;



INSERT INTO CONTACTO_CLIENTE (Usuario, contra) VALUES ('esaa@gmail.com', '1234');
INSERT INTO CONTACTO_CLIENTE (nombre_contacto, correo_electrónico, telefono, estado, asunto, mensaje) VALUES ('Javier', '2117031344@upfim.edu.mx', '7721571986','Hidalgo','Escrituras','Perdi mis papeles');



SELECT Usuario, contra from contacto_cliente
  where Usuario='nuevo_usuario' and contra='nueva_contraseña' ;

select *from contacto_cliente;
select *from  Administrador;

delete from CONTACTO_CLIENTE where (id_cont =11);


create user iris @'localhost' identified by '070522';
grant all privileges on juzgado.CONTACTO_CLIENTE to iris @'localhost';

#SHA1 ENCRIPTA CONTRASEÑalter GIP.HUB
#MD5 ENCRIPTA CONTRASEÑalter
select * from mysql.user;


create table necesitar
(id_necesitar int (4) unsigned not null primary key,
id_cont int auto_increment, FOREIGN KEY (id_cont) REFERENCES CONTACTO_CLIENTE (id_cont),
id_consultas int (2) unsigned not null, FOREIGN KEY (id_consultas) REFERENCES CONSULTAS (id_consultas))
engine=InnoDB;

create table CONSULTAS
(id_consultas int (4) unsigned not null primary key, 
familiar varchar (5),
penal varchar (5),
agrario varchar (5),
num_expediente int (4) unsigned not null, foreign key (num_expediente) references ASUNTOS (num_expediente))
engine=InnoDB;

create table ASUNTOS
(num_expediente int (4) unsigned not null primary key, 
tipo_asunto varchar (10),
honorarios int (7),
pago_inicial int (5),
pago_final int (5), 
id_trib int (4) unsigned not null, foreign key (id_trib) references TRIBUNAL (id_trib))
engine=InnoDB;

create table TRIBUNAL
(id_trib int (4) unsigned not null primary key,
nombre_tribunal varchar (15),
estado varchar (10),
localidad varchar (15))
engine=InnoDB;

select *from bitacora;
create table bitacora
(id_evento int primary key auto_increment not null,
accion varchar(40),
tabla varchar(40),
usuario varchar(60),
fecha datetime);

############################################################################################# TRIGGER 
#################################################I N S E R T A R 
drop trigger if exists insertarContacto;
create trigger insertarContacto
after insert on CONTACTO_CLIENTE
for each row 
insert into bitacora (accion, tabla, usuario, fecha)
values ('insertar', 'CONTACTO', user (), now());

drop trigger if exists insertarConsultas;
create trigger insertarConsultas
after insert on CONSULTAS
for each row 
insert into bitacora (accion, tabla, usuario, fecha)
values ('insertar', 'CONSULTAS', user (), now());

drop trigger if exists insertarAsuntos;
create trigger insertarAsuntos
after insert on ASUNTOS
for each row 
insert into bitacora (accion, tabla, usuario, fecha)
values ('insertar', 'ASUNTOS', user (), now());

drop trigger if exists insertarTribunal;
create trigger insertarTribunal
after insert on TRIBUNAL
for each row 
insert into bitacora (accion, tabla, usuario, fecha)
values ('insertar', 'TRIBUNAL', user (), now());

################################################# E L I M I N A R 

drop trigger if exists eliminarContacto;
create trigger eliminarContacto
after delete on CONTACTO_CLIENTE
for each row
insert into bitacora (accion, tabla, usuario, fecha)
values ('eliminar', 'CONTACTO', user (), now());

drop trigger if exists eliminarConsultas;
create trigger eliminarConsultas
after delete on CONSULTAS
for each row
insert into bitacora (accion, tabla, usuario, fecha)
values ('eliminar', 'CONSULTAS', user (), now());

drop trigger if exists eliminarAsuntos;
create trigger eliminarAsuntos 
after delete on ASUNTOS
for each row
insert into bitacora (accion, tabla, usuario, fecha)
values ('eliminar', 'ASUNTOS', user (), now());

drop trigger if exists eliminarTribunal;
create trigger eliminarTribunal
after delete on TRIBUNAL
for each row
insert into bitacora (accion, tabla, usuario, fecha)
values ('eliminar', 'TRIBUNAL', user (), now());

################################################# A C T U A L I Z A R 

drop trigger if exists actualizarContacto;
create trigger actualizarContacto
after update on CONTACTO_CLIENTE
for each row
insert into bitacora (accion, tabla, usuario, fecha)
values ('actualizar', 'CONTACTO', user (), now());
update CONTACTO_CLIENTE set nombre_contacto = '___' where (id_cont=__);

drop trigger if exists actualizarConsultas;
create trigger actualizarConsultas
after update on CONSULTAS
for each row
insert into bitacora (accion, tabla, usuario, fecha)
values ('actualizar', 'CONSULTAS', user (), now());
update CONSULTAS set familiar = '___' where (id_consultas=__);

drop trigger if exists actualizarAsuntos;
create trigger actualizarAsuntos
after update on ASUNTOS
for each row
insert into bitacora (accion, tabla, usuario, fecha)
values ('actualizar', 'ASUNTOS', user (), now());
update ASUNTOS set tipo_asunto = '___' where (num_expediente=__);

drop trigger if exists actualizarTribunal;
create trigger actualizarTribunal
after update on TRIBUNAL
for each row
insert into bitacora (accion, tabla, usuario, fecha)
values ('actualizar', 'TRIBUNAL', user (), now());
update TRIBUNAL set  nombre_tribunal = '___' where (id_trib=__);



############################################################################################# PROCEDIMIENTO ALMACENADO
################################################# I N S E R T A R 
drop procedure if exists insertarContacto;
delimiter $
create procedure insertarContacto #nombre del procedimiento
(in id_cont int, in nombre_contacto varchar (40),in correo_electrónico varchar (30),in telefono double,in estado varchar (30), in municipio varchar(30),in asunto varchar (30),in mensaje varchar (200))/*parametros de entrada*/
begin /*inicio del procedimiento*/
insert into CONTACTO (id_cont, nombre_contacto, correo_electrónico, telefono, estado, municipio, asunto, mensaje) 
values (id_cont, nombre_contacto , correo_electrónico,  telefono,  estado, municipio, asunto, mensaje); #nombramiento de los parametros con abreviaturas
end $

CALL InsertarContacto('nombre_contacto', 'correo_electronico', 'telefono', 
  'estado', 'municipio', 'asunto', 'mensaje');

####################################################################################
delimiter $
CREATE PROCEDURE InsertarContacto(
    IN p_nombre_contacto VARCHAR(40),
    IN p_correo VARCHAR(30),
    IN p_telefono DOUBLE,
    IN p_estado VARCHAR(30),
    IN p_municipio VARCHAR(30),
    IN p_asunto VARCHAR(30),
    IN p_mensaje VARCHAR(200))
BEGIN
    INSERT INTO CONTACTO_CLIENTE (
        nombre_contacto,
        correo,
        telefono,
        estado,
        municipio,
        asunto,
        mensaje) 
        VALUES (
        p_nombre_contacto,
        p_correo,
        p_telefono,
        p_estado,
        p_municipio,
        p_asunto,
        p_mensaje);
end $

CALL InsertarContactoCliente('Juan Pérez', 'juan@example.com', 123456789, 'Ciudad de México', 'Benito Juárez', 'Consulta', 'Hola, quiero hacer una consulta sobre...');

#######################################################################################################

delimiter $
CREATE PROCEDURE InsertarAdministrador(
    IN p_nombre_admin VARCHAR(35),
    IN p_paterno VARCHAR(35),
    IN p_materno VARCHAR(35),
    IN p_cargo VARCHAR(35),
    IN p_usuario VARCHAR(35),
    IN p_contra VARCHAR(20),
    IN p_contra_2 VARCHAR(20))
BEGIN
    INSERT INTO Administrador (
        nombre_admin,
        paterno,
        materno,
        cargo,
        usuario,
        contra,
        contra_2)
        VALUES (
        p_nombre_admin,
        p_paterno,
        p_materno,
        p_cargo,
        p_usuario,
        p_contra,
        p_contra_2);
end $





drop procedure if exists insertarConsultas;
delimiter $
create procedure insertarConsultas #nombre del procedimiento
(in idConsultas int, in familiar varchar (5),in penal varchar (5),in agrario varchar (5),in num_Exp int (4))/*parametros de entrada*/
begin /*inicio del procedimiento*/
insert into CONSULTAS (id_consultas , familiar, penal, agrario, num_expediente) 
values (idConsultas, familiar, penal, agrario, num_Exp); #nombramiento de los parametros con abreviaturas
end $

drop procedure if exists insertarAsuntos;
delimiter $
create procedure insertarAsuntos #nombre del procedimiento
(in numExp int, in tip_Asu varchar (10),in honorarios int (7),in pago_inicial int (5),in pago_final int (5),in id_Tribunal int (4))/*parametros de entrada*/
begin /*inicio del procedimiento*/
insert into ASUNTOS (numExp , tip_Asu, honorarios, pago_inicial, pago_final, id_trib) 
values (numExp, tip_Asu , honorarios,pago_inicial, pago_final, id_Tribunal); #nombramiento de los parametros con abreviaturas
end $

drop procedure if exists insertarTribunal;
delimiter $
create procedure insertarTribunal #nombre del procedimiento
(in id_Tribunal int, in nom_trib varchar (15),in estado varchar (10),in localidad varchar (15))/*parametros de entrada*/
begin /*inicio del procedimiento*/
insert into TRIBUNAL ( id_trib, nombre_tribunal, estado, localidad) 
values (id_Tribunal, nom_trib , estado, localidad); #nombramiento de los parametros con abreviaturas
end $

################################################# E L I M I N A R
drop procedure if exists eliminarContacto;
 delimiter $
 create procedure eliminarContacto
 (in  idCont int) #(ide) asignacion de nombre del parametro de entrada en abreviatura------ (int) es el tipo de dato que tiene el parametro 
 begin 
 delete from CONTACTO_CLIENTE where id_cont = idCont; #id de la tabla haciendo comparacion con el nombramiento anterior donde se eliminará el registro
 end $
 
 drop procedure if exists eliminarConsultas;
 delimiter $
 create procedure eliminarConsultas
 (in  idCons int) #(ide) asignacion de nombre del parametro de entrada en abreviatura------ (int) es el tipo de dato que tiene el parametro 
 begin 
 delete from CONSULTAS where id_consultas = idCons; #id de la tabla haciendo comparacion con el nombramiento anterior donde se eliminará el registro
 end $
 
  drop procedure if exists eliminarAsuntos;
 delimiter $
 create procedure eliminarAsuntos
 (in  num_Exp int) #(ide) asignacion de nombre del parametro de entrada en abreviatura------ (int) es el tipo de dato que tiene el parametro 
 begin 
 delete from ASUNTOS where num_expediente = num_Exp; #id de la tabla haciendo comparacion con el nombramiento anterior donde se eliminará el registro
 end $
 
   drop procedure if exists eliminarTribunal;
 delimiter $
 create procedure eliminarTribunal
 (in  id_tribunal int) #(ide) asignacion de nombre del parametro de entrada en abreviatura------ (int) es el tipo de dato que tiene el parametro 
 begin 
 delete from TRIBUNAL where id_trib = id_tribunal; #id de la tabla haciendo comparacion con el nombramiento anterior donde se eliminará el registro
 end $
 
 ################################################# A C T U A L I Z A R
  drop procedure actualizarContacto;
  delimiter $
  create procedure actualizarContacto
  (in idC int, in nom_cont varchar (30), in email varchar (15), in tel double, in asunto varchar (10), in mensaje varchar (30))
  begin
  update CONTACTO_CLIENTE
  set nombre_contacto = nom_cont, correo_electrónico = email, telefono = tel , asunto = asunto, mensaje = mensaje
  where id_cont =idC;
  end$

  drop procedure actualizarConsulta;
  delimiter $
  create procedure actualizarConsulta
  (in idCs int, in familiar varchar (5), in penal varchar (5), in agrario varchar (5), in num_exp int (4))
  begin
  update CONSULTAS
  set familiar = familiar, penal = penal, agrario = agrario, num_exp = num_expediente
  where id_consultas =idCs;
  end$
  
  
  drop procedure actualizarAsuntos;
  delimiter $
  create procedure actualizarAsuntos
  (in num_exp int, in tip_asun varchar (10), in honorario int (7), in pag_ini int (5), in pag_fin int (5), in id_trib int (4))
  begin
  update ASUNTOS
  set tip_asun = tipo_asunto, honorario = honorarios, pag_ini = pago_inicial, pag_fin = pago_final
  where num_expediente = num_exp;
  end$
  
   drop procedure actualizarTribunal;
  delimiter $
  create procedure actualizarTribunal
  (in id_trib int, in nom_tit varchar (15), in edo varchar (10), in loc varchar (15))
  begin
  update TRIBUNAL
  set nom_tit = nombre_titular, edo = estado, loc = localidad
  where id_trib = id_trib;
  end$
  
  ################################################# C O N S U L T A R 
drop procedure if exists consultarContacto;
  delimiter $
  create procedure consultarContacto
  (in idCont int) 
  begin
  select *from CONTACTO
  where id_cont =idCont;
  end $

drop procedure if exists consultarConsultas;
  delimiter $
  create procedure consultarConsultas
  (in idC int) 
  begin
  select *from CONSULTAS
  where id_consultas =idC;
  end $
  
  drop procedure if exists consultarAsunto;
  delimiter $
  create procedure consultarAsunto
  (in num_exp int) 
  begin
  select *from ASUNTOS
  where num_expediente = num_exp;
  end $
  
  drop procedure if exists consultarTribunal;
  delimiter $
  create procedure consultarTribunal
  (in id_trib int) 
  begin
  select *from TRIBUNAL
  where id_trib = id_trib;
  end $