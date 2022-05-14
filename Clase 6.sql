use negocio;

-- Laboratorio group by
-- 1- Crear la tabla 'autos' en una nueva base de datos (Vehiculos) con el siguiente detalle:

-- 	codigo	INTEGER y PK
-- 	marca	VARCHAR(25)
-- 	modelo	VARCHAR(25)
-- 	color	VARCHAR(25)
-- 	anio	INTEGER
-- 	precio	DOUBLE

--  nota: (anio - año) seguramente tu computadora tiene soporte para la letra ñ,
--        pero muchas instalaciones (ej: web host alquilados) pueden que no tenga soporte para esa letra.
-- 		  en programación se acostumbra a usar los caracteres menores a 128 en la tabla ASCII.

create table autos(
	codigo int auto_increment primary key,
    marca varchar(25),
    modelo varchar(25),
    color varchar(25),
    anio int,
    precio double
);
describe autos;
-- 2- Agregar el campo patente despues del campo modelo.
alter table autos add patente varchar(12) after modelo;

-- 3- Cargar la tabla con 15 autos (hacerlo con MySQL WorkBench o el INSERT INTO).

insert into autos (marca,modelo,color,anio,precio) values ('Ford','Ka','Negro',2011,1000000);
insert into autos (marca,modelo,color,anio,precio) values ('VW','Suran','Negro',2015,2000000);
insert into autos (marca,modelo,color,anio,precio) values ('VW','Gol','Rojo',2016,2000000);
insert into autos (marca,modelo,color,anio,precio) values ('Peugeot','208','Negro',2016,2200000);
insert into autos (marca,modelo,color,anio,precio) values ('Renault','Clio','Azul',2010,1000000);
insert into autos (marca,modelo,color,anio,precio) values ('Renault','12','Azul',1990,1000000);
insert into autos (marca,modelo,color,anio,precio) values ('Chevrolet','Spin','Gris',2020,3000000);
insert into autos (marca,modelo,color,anio,precio) values ('VW','Gol','Gris',2016,1000000);


-- 4- Realizar las siguientes consultas:
-- 	a. obtener el precio máximo.
select max(precio) precio_máximo from autos;

-- 	b. obtener el precio mínimo.
select min(precio) precio_mínimo from autos;

-- 	c. obtener el precio mínimo entre los años 2010 y 2018.
select min(precio) precio_mínimo from autos where anio between 2010 and 2018;

-- 	d. obtener el precio promedio.
select avg(precio) precio_promedio from autos;
select round(avg(precio),2) precio_promedio from autos; 

-- 	e. obtener el precio promedio del año 2016.
select round(avg(precio),2) precio_promedio from autos where anio=2016; 

-- 	f. obtener la cantidad de autos.
select count(*) cantidad from autos;

-- 	g. obtener la cantidad de autos que tienen un precio entre $2.000.000 y $2.400.000.
select count(*) cantidad from autos where precio between 2000000 and 2400000;

-- 	h. obtener la cantidad de autos que hay en cada año.
select anio año, count(*) cantidad from autos group by anio;

-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
select anio año, count(*) cantidad, round(avg(precio),2) promedio from autos group by anio;

-- 	j. obtener la suma de precios y el promedio de precios según marca.
select marca, sum(precio) total, round(avg(precio),2) promedio from autos group by marca; 

--  k. informar los autos con el menor precio.
select min(precio) from autos;
select * from autos where precio=(select min(precio) from autos);

--  l. informar los autos con el menor precio entre los años 2016 y 2018.
select * from autos 
	where anio between 2016 and 2018 
    and precio=(select min(precio) from autos where anio between 2016 and 2018);

--  m. listar los autos ordenados ascendentemente por marca,modelo,año.
select * from autos order by marca,modelo,anio;

--  n. contar cuantos autos hay de cada marca.
select marca,count(*) cantidad from autos group by marca;

--  o. borrar los autos del siglo pasado.
delete from autos where anio<2000;

set sql_safe_updates=0;

-- Relaciones entre tablas
-- Agregamos el campo de relación a la tabla facturas    (Clave Foranea) 	(Foreign Key)
alter table facturas add codigoCliente int not null;
describe facturas;
select * from clientes;

insert into facturas values ('a',3001,curdate(),8000,30);
select * from clientes where codigo=30;

-- insert into facturas values ('a',3002,curdate(),8000,300);
select * from clientes where codigo=300;

select * from facturas;
update facturas set codigoCliente=1 where letra='a';
update facturas set codigoCliente=2 where letra='b';
update facturas set codigoCliente=3 where letra='c';
update facturas set codigoCliente=4 where letra='f';

insert into facturas values ('a',3003,curdate(),8000,5);
insert into facturas values ('a',3004,curdate(),3000,6);
insert into facturas values ('a',3005,curdate(),3000,7);
-- insert into facturas values ('a',3006,curdate(),3000,700);

-- creamos la restricción de clave foranea.
alter table facturas
	add constraint FK_facturas_codigoCliente
    foreign key(codigoCliente)
    references clientes(codigo);


-- consulta de producto cartesiano
select * from clientes,facturas;

select count(*) cantidad from clientes;					-- 26 clientes
select count(*) cantidad from facturas; 				-- 16 facturas
select 26*16;											-- 416
select count(*) cantidad from clientes,facturas;		-- 416

-- consulta de producto relacionado
select * from clientes,facturas where codigo=codigoCliente;
select count(*) cantidad from clientes,facturas where codigo=codigoCliente;


/*
		7 tablas
        cada tabla tiene 1000 registros
        el producto cartesiano, genera 1000 a la 7 potencia
        1000000000000000000000

*/
use negocio;
select * from articulos;

select * from clientes,facturas where codigo=codigoCliente;

select * from clientes,facturas where clientes.codigo=facturas.codigoCliente;

select * from negocio.clientes, negocio.facturas where clientes.codigo=facturas.codigoCliente;

select * from negocio.clientes c, negocio.facturas f where c.codigo=f.codigoCliente;

-- select * from hr.COUNTRIES;

-- Uso del Join   ANSI_SQL
select * from clientes c join facturas f on c.codigo=f.codigoCliente;

-- Left Join
select * from clientes c left join facturas f on c.codigo=f.codigoCliente;

-- Right Join
select * from clientes c right join facturas f on c.codigo=f.codigoCliente;

-- Que clientes (nombre, apellido) compraron en el dia de hoy?
select distinct codigo,nombre,apellido,cuit,direccion,comentarios
	from clientes c join facturas f on c.codigo=f.codigoCliente
    where fecha=curdate();
    
-- Cuales son las ventas realizadas a Juan Perez?
select letra,numero,monto 
	from clientes c join facturas f on c.codigo=f.codigoCliente
    where nombre='Juan' and apellido='Perez';

-- Total facturado a Juan Perez?
select sum(monto) total 
	from clientes c join facturas f on c.codigo=f.codigoCliente
    where nombre='Juan' and apellido='Perez';

-- Que clientes (nombre, apellido) compraron en este año (2022)?
select distinct codigo,nombre,apellido,cuit,direccion,comentarios
	from clientes c join facturas f on c.codigo=f.codigoCliente
    where year(fecha)=2022;
    
show databases;
use natalidad;
show tables;
select * from meses;
select * from nacimientos;
select SEXO,month(fecha) mes, semanas, peso, talla,edad_madre from nacimientos;
select SEXO,nombre, semanas, peso, talla,edad_madre 
	from nacimientos n join meses m on month(n.fecha)=m.id;



-- ------------------------
-- Agrego la tabla detalles
-- ------------------------
use negocio;
create table detalles(
letra char(1) not null,
numero int not null,
codigo int not null,
cantidad int unsigned not null,
primary key(letra,numero,codigo)
);

describe detalles;

select * from facturas;
select * from articulos;

-- ------------------------
-- inserto detalles de las facturas
-- ------------------------

insert into detalles values('a',1,3,10);
insert into detalles values('a',1,1,3);
insert into detalles values('a',1,5,3);
insert into detalles values('a',2,3,10);
insert into detalles values('b',3,3,10);

select * from clientes,facturas,detalles,articulos; -- producto cartesiano
select count(*) cantidad from clientes,facturas,detalles,articulos;

-- ------------------------
-- Consulta respetando las relaciones
-- ------------------------

select * from clientes c, facturas f,detalles d,articulos a 
	where c.codigo=f.codigoCliente and f.letra=d.letra 
	and f.numero=d.numero and d.codigo=a.codigo;

-- ------------------------
-- que compro Jyan Perez
-- ------------------------
select a.codigo,a.nombre,a.precio from clientes c,facturas f,detalles d,articulos a 
where c.codigo=f.codigocliente and f.letra=d.letra and f.numero=d.numero 
and d.codigo=a.codigo and c.nombre='juan' and c.apellido='perez' ;

select a.codigo,a.nombre,a.precio from clientes c join facturas f on c.codigo=f.codigocliente 
join detalles d on f.letra=d.letra and f.numero=d.numero 
join articulos a on d.codigo=a.codigo
where c.nombre='juan' and c.apellido='perez';



-- ------------------------
-- agrego restriccion de FK
-- ------------------------

alter table detalles
add constraint FK_facturas_letra_numero
foreign key (letra,numero)
references facturas(letra,numero)
on delete cascade;



-- -------------------------- ------------------------
-- pruebo restriccion con registros validos y no validos
-- -------------------------- ------------------------

insert into detalles values('a',1,4,10);
insert into detalles values('x',3,3,10);




