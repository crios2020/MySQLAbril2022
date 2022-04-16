-- Temas Pendientes

-- Tipo de datos


-- -----------------------------------
-- Tipos de datos más comunes en MySQL
-- -----------------------------------


-- Tipo de datos Texto de datos más comunes

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- char(x)		x
-- varchar(x)	x+1

/*
		nombre char(20)
        
        |Ana                 |					20 bytes
        |Carlos              | 					20 bytes
        |Maximiliano         | 					20 bytes
									Total:		60 bytes
								
        nombre varchar(20)
        
        |Ana                 |					 3 + 1	=  4 bytes
        |Carlos              |					 6 + 1  =  7 bytes
        |Maximiliano         |					11 + 1  = 12 bytes
											Total:		  23 bytes


*/



-- Tipo de datos Numérico

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- bool (boolean)	1	(0 es false distinto de 0 es true)
-- tinyint			1	2^8			256
-- smallint			2	2^16		65536
-- mediumint		3	2^24		16777216
-- int (integer)	4	2^32		4294967296
-- bigint			8	2^64		18446744073709551616
-- float			4	 		
-- double			8
-- decimal(t,d)		t+2 

/*

		edad tinyint unsigned					1 byte
        edad int								4 bytes

		llueve 		si   - no
				    true - false
                    1    - 0

		llueve bool
        
        00000001
        --------
        
        codigo tinyint		(signed)
        
        |--------|---------|
	  -128 		 0 		  127
      
      
		codigo tinyint unsigned
        
        |------------------|
        0				  255
        
      
		Decimales punto flotante
        
        float 32 bits
        
        10/3
        3.333333
        --------
        
        100/3
        33.33333
        --------
        
        1000/3
        333.3333
        --------
        
        double 64 bits
        
        10/3
        3.333333333333333
        -----------------

		100/3
        33.33333333333333
        -----------------
        
        1000/3
        333.3333333333333
        -----------------

		Decimales en formato decimal
        
        decimal(t,d)	t+2
        
        precio decimal(6,3)			8 bytes
        
        ---,---
        
        precio decimal(6,2)			8 bytes		
        
        9999,99
        ----,--
        
        precio decimal(7,2)			9 bytes
        
        99999,99
        -----,--

*/

-- Tipo de datos Fecha y Hora

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- date		3	Año Mes Dia ‘2012-10-25’		'2020/04/16'
-- datetime	8
-- time		3
-- year		1

show databases;
use negocio;

select 'Hola Mundo!';
select 2+2;

-- alias de columna
select 2+2 as total;
select 2+2 total;
select 2+2 valor_total;
select 2+2 'valor total';
select pi() valor_PI;											-- 	formato float
select round(pi(),2) valor_PI;

select curdate() fecha;				-- fecha server					formato date
select curtime() hora;				-- hora server					formato time
select sysdate() fecha_hora;		-- fecha y hora					formato datetime
select version() version;			-- versión del server
select year(curdate()) año;			-- año 							formato year
select month(curdate()) mes;
select day(curdate()) día;
select dayname(curdate());
select dayofweek(curdate());

-- ANSI SQL
-- https://es.wikipedia.org/wiki/SQL


-- Significado de SQL
-- Structured Query Language

-- ANSI SQL
-- En la actualidad el SQL es el estándar de facto de la inmensa mayoría de los SGBD comerciales.
-- Y, aunque la diversidad de añadidos particulares que incluyen las distintas implementaciones
-- comerciales del lenguaje es amplia, el soporte al estándar SQL-92 es general y muy amplio.

-- DDL DML

-- DDL Data Definition Language   (Lenguaje de Definición de Datos)			Estructura de la tabla
-- 		Create table - Drop table - Alter table - Trunate table


-- DML Data Manipilation Language (Lenguaje de Manipulación de Datos)		Manipulación de registros
--  	select - insert - delete - update



show tables;
describe clientes;
select * from clientes;

drop table if exists facturas;
create table facturas(
letra char(1),
numero integer,
fecha date,
monto double,
primary key (letra,numero)
);

drop table if exists articulos;
create table articulos(
codigo integer auto_increment primary key,
nombre varchar(50),
precio double,
stock integer
);


insert into clientes (nombre,apellido,cuit,direccion) values ('Fernando','Ferrari','123455678','Lima2222');
insert into clientes (nombre,apellido,cuit,direccion) values ('Diego','Borro','2222678','viel 222');
insert into clientes (nombre,apellido,cuit,direccion) values ('Lorena','Monte','67822323','Lavalle 234');
insert into clientes (nombre,apellido,cuit,direccion) values ('Melina','Marote','53335678','Peru 650');

insert into articulos values (1,'destornillador',25,50);
insert into articulos values (2,'pinza',35,22);
insert into articulos values (3,'martillo',15,28);
insert into articulos values (4,'maza',35,18);
insert into articulos values (5,'valde',55,13);

insert into facturas values ('a',0001,'2011/10/18',500);
insert into facturas values ('a',0002,'2011/10/18',2500);
insert into facturas values ('b',0003,'2011/10/18',320);
insert into facturas values ('b',0004,'2011/10/18',120);
insert into facturas values ('b',0005,'2011/10/18',560);
-- inserto un registro con la fecha actual
insert into facturas values ('c',0006,curdate(),300);
insert into facturas values ('c',0007,curdate(),1300*1.21);

show databases;
show tables;
describe articulos;
describe clientes;
describe facturas;

select * from articulos;
select * from clientes;
select * from facturas;


-- Modificar o alterar la esctructura de una tabla
-- DDL Alter Table Modify
alter table clientes modify cuit char(13);

-- DDL Alter Table Add
alter table clientes add edad int;
alter table clientes modify edad tinyint after apellido;

-- completar edad a clientes
update clientes set edad=34 where codigo=1;
update clientes set edad=26 where codigo=2;
update clientes set edad=29 where codigo=3;

-- DDL Alter Table Drop
alter table clientes drop edad;


use negocio;
-- Comando DML select

-- comodin * significa todos los campos
select * from clientes;
select nombre,apellido,direccion from clientes;
select nombre,apellido,nombre,curdate() fecha_actual from clientes;
select concat(nombre,' ',apellido) nombre from clientes;

-- Columnas Calculadas
select * from facturas;
select letra, numero, monto, monto*1.21 monto_con_iva, fecha from facturas;

















