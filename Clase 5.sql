show databases;
use negocio;
show tables;

-- Agrupamientos con group by

select letra, sum(monto) total from facturas where letra='a';
select letra, sum(monto) total from facturas where letra='b';
select letra, sum(monto) total from facturas where letra='c';
select letra, sum(monto) total from facturas where letra='f';

select sum(monto) total from facturas;			-- 5890

select 	 (select sum(monto) total from facturas where letra='a')
		+(select sum(monto) total from facturas where letra='b')
        +(select sum(monto) total from facturas where letra='c') 
        +(select sum(monto) total from facturas where letra='f') 
        total;
select distinct letra from facturas order by letra;

/*
	letra	total
	a	 	3890
    b 		1000
    c		 300
    f 		 700

	dada la tabla padron, obtener la cantidad de ciudadanos por estado civil
    
    select estado_civil, count(*) cantidad from padron where estado_civil='Soltero';
	select estado_civil, count(*) cantidad from padron where estado_civil='Casado';
    select estado_civil, count(*) cantidad from padron where estado_civil='Viudo';
	select estado_civil, count(*) cantidad from padron where estado_civil='Divorciado';
    
    select estado_civil, count(*) cantidad from padron group by estado_civil;
    
*/

-- Uso de Group By

-- Total facturado por monto
select letra, sum(monto) total from facturas group by letra;

-- total facturado y cantidad de facturas segun monto
select letra, sum(monto) total, count(*) cantidad from facturas group by letra;

-- total facturado y cantidad de facturas en cada día
select fecha, sum(monto) total, count(*) cantidad from facturas group by fecha;

-- total facturado en cada mes
select concat(year(fecha),'/',month(fecha)) mes from facturas;

-- solo en mysql o mariaDB
select concat(year(fecha),'/',month(fecha)) mes, sum(monto) total from facturas group by mes;

-- para otras versiones de SQL
select concat(year(fecha),'/',month(fecha)) mes, sum(monto) total 
	from facturas 
    group by concat(year(fecha),'/',month(fecha));

show databases;
use Bonus_Track;
show tables;
select * from Top_Spotify;

-- Cantidad de temas por año
select anio año, count(*) cantidad from Top_Spotify group by anio;

-- Cantidad de temas por genero
select genero, count(*) cantidad from Top_Spotify group by genero;

-- Cantidad de temas por año y por genero
select anio año, genero, count(*) cantidad from Top_Spotify group by anio,genero;

use negocio;
show tables;
use natalidad;
select * from nacimientos;
select count(*) cantidad from nacimientos;

-- cantidad de BBs nacidos por hospital
select establecimiento, count(*) cantidad from nacimientos group by establecimiento order by cantidad desc;

-- cantidad de nacimientos por mes
alter table nacimientos add fecha2 date after FECHA;
select concat(substring(fecha,7,4),'/',substring(fecha,4,2),'/',substring(fecha,1,2)) from nacimientos;
update nacimientos set fecha2=concat(substring(fecha,7,4),'/',substring(fecha,4,2),'/',substring(fecha,1,2));
set sql_safe_updates=0;
select curdate();
alter table nacimientos drop fecha;
alter table nacimientos change fecha2 fecha date;

-- cantidad de nacimientos por mes
select month(fecha) mes, count(*) cantidad from nacimientos group by month(fecha);
select month(fecha) mes from nacimientos;

select distinct estado_civil_madre from nacimientos;

-- dada la tabla padron, obtener la cantidad de ciudadanos por estado civil
select estado_civil_madre, count(*) cantidad from nacimientos where estado_civil_madre='Soltera';
select estado_civil_madre, count(*) cantidad from nacimientos where estado_civil_madre='Casada';
select estado_civil_madre, count(*) cantidad from nacimientos where estado_civil_madre='Viuda';
select estado_civil_madre, count(*) cantidad from nacimientos where estado_civil_madre='Divorciada';
select estado_civil_madre, count(*) cantidad from nacimientos where estado_civil_madre='Concubinato';
select estado_civil_madre, count(*) cantidad from nacimientos where estado_civil_madre='Desconocido';
    
select estado_civil_madre, count(*) cantidad from nacimientos group by estado_civil_madre;

-- cantidad de nacimientos por establecimiento por mes
select establecimiento, month(fecha) mes, count(*) cantidad 
	from nacimientos 
    group by establecimiento, month(fecha)
    order by establecimiento;

-- Uso del having 
use negocio;
select letra,sum(monto) total from facturas group by letra;

/*
	letra	total
	a	 	3890
    b 		1000
    c		 300
    f 		 700
*/

-- total facturado por letra (agrupado por letra)
select letra,sum(monto) total from facturas group by letra;

-- Total facturado por letra, mostrar solamente los tipos de letra que tienen un monto total >=1000
select letra,sum(monto) total from facturas group by letra having total>=1000;

-- Total facturado por letra, mostrar solamente los tipos de letra que tienen un monto total >=1000 desde el 2020 en adelante
select letra,sum(monto) total from facturas where year(fecha) >=2020 group by letra having total>=1000;


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

-- 2- Agregar el campo patente despues del campo modelo.

-- 3- Cargar la tabla con 15 autos (hacerlo con MySQL WorkBench o el INSERT INTO).
-- 4- Realizar las siguientes consultas:
-- 	a. obtener el precio máximo.
-- 	b. obtener el precio mínimo.
-- 	c. obtener el precio mínimo entre los años 2010 y 2018.
-- 	d. obtener el precio promedio.
-- 	e. obtener el precio promedio del año 2016.
-- 	f. obtener la cantidad de autos.
-- 	g. obtener la cantidad de autos que tienen un precio entre $235.000 y $240.000.
-- 	h. obtener la cantidad de autos que hay en cada año.
-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
-- 	j. obtener la suma de precios y el promedio de precios según marca.
--  k. informar los autos con el menor precio.
--  l. informar los autos con el menor precio entre los años 2016 y 2018.
--  m. listar los autos ordenados ascendentemente por marca,modelo,año.
--  n. contar cuantos autos hay de cada marca.
--  o. borrar los autos del siglo pasado.


-- Tema pendiente cantidad de nacimientos por establecimiento por mes colocando el nombre del mes
use natalidad;
create table meses(
	id int primary key,
    nombre varchar(20)
);
insert into meses values
	(1,'Enero'),
    (2,'Febrero'),
    (3,'Marzo'),
    (4,'Abril'),
    (5,'Mayo'),
    (6,'Junio'),
    (7,'Julio'),
    (8,'Agosto'),
    (9,'Septiembre'),
    (10,'Octubre'),
    (11,'Noviembre'),
    (12,'Diciembre');

select * from meses;

show tables;

-- cantidad de nacimientos por establecimiento por mes
select establecimiento, month(fecha) mes, count(*) cantidad 
	from nacimientos 
    group by establecimiento, month(fecha)
    order by establecimiento;
    
-- colocar el nombre del mes usando subquery    
select establecimiento, (select nombre from meses where id=(month(fecha))) mes, count(*) cantidad 
	from nacimientos 
    group by establecimiento, month(fecha)
    order by establecimiento;

-- colocoar el nombre del mes usando case
select establecimiento, 
	(
		CASE 
			WHEN month(fecha) = 1 THEN 'Enero'
            WHEN month(fecha) = 2 THEN 'Febrero'
            WHEN month(fecha) = 3 THEN 'Marzo'
            WHEN month(fecha) = 4 THEN 'Abril'
            WHEN month(fecha) = 5 THEN 'Mayo'
            WHEN month(fecha) = 6 THEN 'Junio'
            WHEN month(fecha) = 7 THEN 'Julio'
            WHEN month(fecha) = 8 THEN 'Agosto'
            WHEN month(fecha) = 9 THEN 'Septiembre'
            WHEN month(fecha) = 10 THEN 'Octubre'
            WHEN month(fecha) = 11 THEN 'Noviembre'
            WHEN month(fecha) = 12 THEN 'Diciembre'
		end
    ) mes, 
    count(*) cantidad 
	from nacimientos 
    group by establecimiento, month(fecha)
    order by establecimiento
    ;   
    
-- colocar el mes usando join
select * from nacimientos, meses where month(fecha)=id;
select establecimiento, nombre mes , count(*) cantidad from nacimientos, meses where month(fecha)=id group by establecimiento,nombre;

