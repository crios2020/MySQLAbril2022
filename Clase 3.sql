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

-- No ANSI
select *, monto*1.21 monto_con_iva from facturas;

-- Filtrar registros con where
-- operadores = < <= > >= != <>
select * from clientes where codigo=3;
select * from clientes where codigo <3;
select * from clientes where codigo <=3;
select * from clientes where codigo >3;
select * from clientes where codigo >=3;
select * from clientes where codigo !=3;
select * from clientes where codigo <>3;

select * from clientes where nombre='Laura';

insert into clientes (nombre,apellido) values 
	('Laura','Perez'),('Laura','Gomez'),
    ('Laura','Sosa'),('Laura','Soto');

-- clausula limit
select * from clientes;
select * from clientes limit 5;
select * from clientes limit 5,5;
select * from clientes limit 10,5;

-- limit en SQL SERVER
-- SELECT TOP 100,200 * FROM PRODUCT;

-- Operadores logicos and or
select * from clientes where nombre='Laura' or nombre='Juan';
select * from clientes where nombre='Laura' and nombre='Juan';

insert into clientes (nombre,apellido) values 
	('Juan','Perez'), ('Juan','Segovia'),
    ('Juan','Lorenzo'),('Juan','Mendez');
    
-- Listado de clientes que viven en Haedo y Ramos Mejia
-- select * from clientes where localidad='Haedo' or localidad='Ramos Mejia';

select * from clientes where nombre='Laura' and apellido='Perez';
select * from clientes where nombre='Laura' or apellido='Perez';

select * from facturas;
insert into facturas values
	('a',3,curdate(),290),('a',4,curdate(),300),
    ('a',5,curdate(),320),('a',6,curdate(),390),
    ('a',7,curdate(),400),('a',8,curdate(),420);

select * from facturas where monto>=300 and monto <=400;		-- Monto entre 300 y 400$

select * from facturas where monto>=300 or monto <=400;			-- todo

select * from facturas where monto < 300 or monto >400;			-- facturas con monto que no entre 300 y 400

-- Operador between - not between
select * from facturas where monto between 300 and 400;
select * from facturas where monto not between 300 and 400;


select * from clientes 
	where codigo=3
    or codigo=6
    or codigo=7
    or codigo=11
    or codigo=13;
    
select * from clientes 
	where codigo!=3
    and codigo!=6
    and codigo!=7
    and codigo!=11
    and codigo!=13;

-- Operador in - not in
select * from clientes where codigo in (3, 6, 7, 11, 13);
select * from clientes where codigo not in (3, 6, 7, 11, 13);
select * from clientes where nombre in ('Juan','Laura');

-- Valores null (desconocido)
insert into clientes (nombre,apellido,direccion) values
	('Andrea','Moretti',''),
    ('Gustavo','Campi',null);

select * from clientes where direccion = '';
select * from clientes where direccion is null;
select * from clientes where direccion is not null;

-- select * from clientes where direccion = null;		-- no funciona
insert into clientes (nombre,apellido) values 
	('Omar','Perez'), ('Armando','Segovia'),
    ('Carlos','Perez'), ('Martin','Segovia'),
    ('Mario','Perez'), ('Mariano','Segovia'),
    ('Maria','Perez'), ('Mariana','Segovia'),
    ('Marta','Perez'), ('Monica','Segovia'),
    ('Magali','Perez'), ('Mariela','Segovia'),
    ('Micaela','Perez'), ('Melina','Segovia'),
    ('Martina','Perez'), ('Mirta','Segovia'),
    ('Mariel','Perez'), ('Maricel','Segovia'),
    ('Maximiliano','Lorenzo'),('Martino','Mendez');
    
insert into clientes (nombre,apellido) values 
	('m','Perez'), ('Marcela','Segovia');
    
insert into clientes (nombre,apellido) values 
	('Lee','Perez'), ('Ana','Segovia');

insert into clientes (nombre,apellido) values 
	('Victor','Perez'), ('Valentina','Segovia');

-- select * from libros where autor='Borges';
-- select * from libros where autor like '%borges%';

-- Busqueda de expresiones usando like - not like
select * from clientes where nombre like 'm%';
select * from clientes where nombre like 'ma%';
select * from clientes where nombre like 'mar%';
select * from clientes where nombre like '%a';
select * from clientes where nombre not like '%a';
select * from clientes where nombre like '%ar%';
select * from clientes where nombre like '_';
select * from clientes where nombre like '__';
select * from clientes where nombre like '___';
select * from clientes where nombre like '____';
select * from clientes where nombre like '_____%';
select * from clientes where nombre like 'm_r%';


-- Order By
select * from clientes;

select * from clientes order by nombre;
select * from clientes order by nombre asc;
select * from clientes order by nombre desc;
select * from clientes order by apellido, nombre;
select * from clientes order by apellido desc, nombre;


-- DML Insert

-- Insert normal con definición de campos  ANSI
insert into clientes (nombre,apellido,cuit) values ('Anabella','Garcia','Medrano 162');
insert into clientes (nombre,apellido,cuit,direccion,comentarios) values ('Macarena','Lopez','1222222','Perette 770','');

-- Insert Abreviado sin definición de campos   ANSI
insert into clientes values (null,'Macarena','Lopez','1222222','Perette 770','');

/*
use colegio;
insert into alumnos (nombre,apellido,edad,idCurso) values ('Nicolas','Mendoza',18,1);
insert into alumnos values (null,'Karina','Mendoza',18,1);

alter table alumnos add direccion varchar(50);
describe alumnos;
*/
use negocio;
-- Insert set	NO ANSI
insert clientes set nombre='Betiana', apellido='Norman', direccion='Lima 222';

-- Inser Masivo	  	ANSI
insert into clientes (nombre,apellido) values
	('Omar','Perez'), 
    ('Armando','Segovia'),
    ('Carlos','Perez'), 
    ('Martin','Segovia'),
    ('Mario','Perez'), 
    ('Mariano','Segovia'),
    ('Maria','Perez'), 
    ('Mariana','Segovia'),
    ('Marta','Perez'), 
    ('Monica','Segovia'),
    ('Magali','Perez'), 
    ('Mariela','Segovia'),
    ('Micaela','Perez'), 
    ('Melina','Segovia'),
    ('Martina','Perez'), 
    ('Mirta','Segovia'),
    ('Mariel','Perez'), 
    ('Maricel','Segovia'),
    ('Maximiliano','Lorenzo'),
    ('Martino','Mendez');
    
insert into clientes (nombre,apellido) values ('Omar','Perez');
insert into clientes (nombre,apellido) values ('Armando','Segovia');
insert into clientes (nombre,apellido) values ('Carlos','Perez'); 
insert into clientes (nombre,apellido) values ('Martin','Segovia');
insert into clientes (nombre,apellido) values ('Mario','Perez');
insert into clientes (nombre,apellido) values ('Mariano','Segovia');
insert into clientes (nombre,apellido) values ('Maria','Perez'); 
insert into clientes (nombre,apellido) values ('Mariana','Segovia');
insert into clientes (nombre,apellido) values ('Marta','Perez');
insert into clientes (nombre,apellido) values ('Monica','Segovia');
insert into clientes (nombre,apellido) values ('Magali','Perez');
insert into clientes (nombre,apellido) values ('Mariela','Segovia');
insert into clientes (nombre,apellido) values ('Micaela','Perez');
insert into clientes (nombre,apellido) values ('Melina','Segovia');
insert into clientes (nombre,apellido) values ('Martina','Perez');
insert into clientes (nombre,apellido) values ('Mirta','Segovia');
insert into clientes (nombre,apellido) values ('Mariel','Perez');
insert into clientes (nombre,apellido) values ('Maricel','Segovia');
insert into clientes (nombre,apellido) values ('Maximiliano','Lorenzo');
insert into clientes (nombre,apellido) values ('Martino','Mendez');

-- DML Delete
delete from clientes where codigo=3;

-- delete masivo
-- delete from clientes where nombre='Juan';
-- delete from clientes;

-- desactivamos la protección safe update de workbench
set sql_safe_updates =0;			-- =0 desactiva    =1;

select * from clientes;

insert into clientes (codigo,nombre,apellido) values (200,'Homero','Simpson');
delete from clientes where codigo=200;

insert into clientes (nombre,apellido) values ('Bart','Simpson');

-- DDL Trucante Table   -- no nos protege safe-update
truncate clientes;


-- Tema pendiente -- DML Update









