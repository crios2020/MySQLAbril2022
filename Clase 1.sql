/*
Curso: 		Introducción a las bases de datos y SQL		
Duración:	18 hs reloj.
Día:		Sábados	10:00 a 13:00 hs.
Profe:		Carlos Rios			carlos.rios@educacionit.com

Materiales:	alumni.educacionit.com
			user: email
			pass: dni

			github: https://github.com/crios2020/MySQLAbril2022

Software:	Server: MySQL Community Server - MariaDB Community Server
					paquete XAMPP apachefriends.org

			Client: MySQL WorkBench https://dev.mysql.com/downloads/workbench/
			
			Clientes Alternativos: 		DBeaver		dbeaver.io
										Heidy		https://www.heidisql.com/
										VSCode		


			
		Paquete XAMPP
		
		X		Windows Linux Mac
		A		Apache Web Server
		M		MySQL Community Server - MariaDB Community Server
		P		PHP
		P		PERL
		
		
		Paquete WAMP wampserver.com
		
		W		Windows
		A		Apache Web Server
		M		MySQL Community Server
		P		PHP
		
		Paquete LAMP MAMP

*/

-- Linea de comentarios

/* 
	Bloque
    de
    Comentarios
*/ 

show databases;			-- muestra las bds del server

-- ; es el terminador de sentencias

SHOW DATABASES;			-- el lenguaje no es case sensitive

-- ctrol enter	para ejecutar

-- borrar una bd
-- drop database if exists negocio;
-- drop database if exists NEGOCIO;
-- drop database if exists colegio;

-- creamos la BD para este curso
create database negocio;
-- CREATE DATABASE NEGOCIO;

use negocio;	-- activa la bd negocio

show tables;

-- Campos - columnas
-- Registros - filas

/*
		Memoria RAM:	Veloz		Volatil			Cara
		Disco Duro:		Lento		Persistente		Economico	

*/

-- borra la tabla clientes
drop table if exists clientes;

-- crear la tabla clientes
create table clientes(
	codigo 		int 		auto_increment primary key,
    nombre 		varchar(25) not null,
    apellido 	varchar(25) not null,
    cuit 		varchar(13),
    direccion 	varchar(50),
    comentarios varchar(255)
);

describe clientes;				-- describe la estructura de la tabla


select * from clientes;			-- registros de la tabla


-- inserción de registros
insert into clientes (nombre,apellido,cuit,direccion) values ('Fernando','Ferrari','123455678','Lima2222');
insert into clientes (nombre,apellido,cuit,direccion) values ('Diego','Borro','2222678','viel 222');
insert into clientes (nombre,apellido,cuit,direccion) values ('Lorena','Monte','67822323','Lavalle 234');
insert into clientes (nombre,apellido,cuit,direccion) values ('Melina','Marote','53335678','Peru 650');

INSERT INTO `negocio`.`clientes` (`nombre`, `apellido`, `cuit`, `direccion`) VALUES ('Fernando', 'Tripoli', '33333', 'Medrano 162');

-- Temas Pendientes
-- Tipo de datos
-- ANSI SQL
-- DDL DML













