-- Clase 4
use negocio;
show tables;

-- DML Update 			ANSI SQL
select * from clientes;

update clientes set cuit='34563' where codigo=3;
update clientes set direccion='Peña 2485' where codigo=2;
update clientes set cuit='99999', direccion='Lima 293', comentarios='Cancela deuda en Junio' where codigo=1;

select * from clientes where nombre='Mario';

-- Update Masivo
update clientes set nombre='Maria' where nombre='Mario';
update clientes set nombre='Maria';


-- Desafio Modulo 2

-- Ejercicio 1
create database Bonus_Track;
use Bonus_Track;
show tables;
select * from Top_Spotify;

select * from Top_Spotify order by genero asc, artista asc;

-- Ejercicio 2
select artista,titulo,genero 
	from Top_Spotify
    order by artista, titulo
    limit 10;

select artista,titulo,genero 
	from Top_Spotify
    order by artista, titulo
    limit 11,5;
    
-- select * from Top_Spotify limit 5,5;
-- select * from Top_Spotify where ano between 2012 and 2014;
select * from Top_Spotify order by artista;

select id,titulo,artista,genero,ano año from Top_Spotify where artista='Madonna';

select id,titulo,artista,genero,ano año 
	from Top_Spotify 
    where genero='pop' 
    order by titulo;
    
select id,titulo,artista,genero,ano año 
	from Top_Spotify 
    where genero='pop' and ano=2015
    order by artista, titulo;

select count(*) from Top_Spotify;



-- truncate Top_Spotify;

-- trim -- quita espacios adelante y atras
update Top_Spotify set titulo=trim(titulo), artista=trim(artista), genero=trim(genero);
set sql_safe_updates=0;

use Bonus_Track;

select id,titulo,artista,genero,ano año 
	from Top_Spotify 
    where ano<2011 
    and genero like '%Dance Pop%'
    order by titulo;

show databases;
use negocio;
-- Funciones de agrupamiento

-- Función max(arg)  arg: numerico, texto o date
select max(monto) from facturas;
select max(monto) monto_maximo from facturas;
select max(nombre) from clientes;
select max(fecha) ultima_fecha from facturas;

insert into clientes (nombre,apellido) values
	('Ursula','Gomez'),('Zeferino','Lopez');

-- Función min(arg) 	arg: numerico, texto o date
select min(monto) monto_minimo from facturas;
select min(nombre) from clientes;
select min(fecha) primer_fecha from facturas;

-- Función sum(numero) suma
select sum(monto) total from facturas;
select sum(monto) total_hoy from facturas where fecha=curdate();
select sum(monto) total_abril from facturas where month(fecha)=4 and year(fecha)=2022;

-- Función avg(numero)	promedio
select avg(monto) promedio from facturas;
select round(avg(monto),2) promedio from facturas;

-- Función count()
select count(*) cantidad from clientes;							-- Total 80 clientes
select count(*) cantidad from facturas;
select count(*) cantidad from Bonus_Track.Top_Spotify;

select count(direccion) cantidad from clientes;					-- solo 3 clientes con direccion

select count(*) cantidad from clientes where direccion is not null;		-- 3

-- subconsultas subquery
select max(monto) from facturas;		-- 2500

select * from facturas where monto=2500;

select * from facturas where monto=(select max(monto) from facturas);

-- cantidad de clientes + cantidad de temas musicales
select 
	(select count(*) from clientes)-- cantidad de clientes
    +
    (select count(*) from Bonus_Track.Top_Spotify)-- cantidad de temas musicales
    cantidad;


-- Tema pendiente Group By  having





    

