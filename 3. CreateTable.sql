-- Crear Tablas

CREATE TABLE clientes (
	id_cliente		integer	,
	nombre			varchar(10) 	NOT NULL,
	apellido1		varchar(10)		NOT NULL,
	apellido2		varchar(10)		NOT NULL,
	nacionalidad	char(1)			NOT NULL,
	fecha_nac		date			NOT NULL,
	dni				integer			NOT NULL,
	correo			varchar(30)		NOT NULL,
	PRIMARY KEY		(id_cliente)		
	);

CREATE TABLE lugares_evento (
	id_lugar		integer,
	nombre			varchar(10) 	NOT NULL,
	direccion		text			NOT NULL,
	PRIMARY KEY		(id_lugar)
	);

CREATE TABLE regiones_rio (
	id_region		integer,
	nombre			varchar(10) 	NOT NULL,
	descripcion		text,
	PRIMARY KEY		(id_region)
);

CREATE TABLE empresas (
	id_empresa		integer,
	nombre			varchar(10) 	NOT NULL,
	correo			varchar(30)		NOT NULL,
	PRIMARY KEY		(id_empresa)
);

CREATE TABLE autorizaciones (
	id_empresa 		integer,
	cant_max		integer			NOT NULL
);

CREATE TABLE tipos_entrada (
	id_empresa		integer,
	id_tipo			integer			NOT NULL,
	tipo_ent		char(2)			NOT NULL,
	sector			integer			NOT NULL,
	calidad			integer			NOT NULL,
	tipo_des		char(1)			NOT NULL,
	ubi				char(2)			
);

CREATE TABLE reserva (
	id_reserva		integer,
	f_h_emi			timestamp		NOT NULL,
	id_cliente		integer			NOT NULL,
	monto_reales	integer,
	fecha_pago		date,
	PRIMARY KEY		(id_reserva)		
);

CREATE TABLE escuelas_samba (
	id_escuela 		integer,
	nombre_gres		varchar(30)		NOT NULL,
	fecha_funda		date			NOT NULL,
	direccion		text			NOT NULL,
	color			varchar(15)		NOT NULL,
	id_region		integer			NOT	NULL,
	PRIMARY KEY		(id_escuela)
);

CREATE TABLE hist_grupo (
	id_escuela		integer,
	fecha_ini		integer			NOT NULL,
	grupo			char(1)			NOT NULL,
	fecha_fin		date
);

CREATE TABLE protagonistas (
	id_prota		integer,
	nombre			varchar(10)		NOT NULL,
	apellido1		varchar(10)		NOT NULL,
	apellido2		varchar(10)		NOT NULL,
	genero			char(1)			NOT NULL,
	fecha_nac		date			NOT NULL,
	dni				integer			NOT NULL,
	id_escuela		integer
);

CREATE TABLE carnavales_anual (
	ano				date,
	fecha_ini		date			NOT NULL,
	fecha_fin		date			NOT NULL,
	id_prota			integer			NOT NULL,
	PRIMARY KEY		(ano)
);

CREATE TABLE eventos (
	ano 			date			NOT NULL,
	id_evento		integer			NOT NULL,
	tipo			char(1)			NOT NULL,
	fecha_ini		date			NOT NULL,
	hora_ini		time			NOT NULL,
	tipo_audi		varchar(3)		NOT NULL,
	pago			char(1)			NOT NULL,
	descripcion		text,
	costo_reales	integer,
	id_lugar		integer
);

CREATE TABLE participacion (
	id_escuela		integer			NOT NULL,
	fecha_ini		date			NOT NULL,
	id_evento		integer			NOT NULL,
	hora_ini		time			NOT NULL,
	orden_des		integer			NOT NULL,
	posicion_fin	integer			NOT NULL,
	tema_gen		varchar(20)		NOT NULL,
	titu_letr		text			NOT NULL
);

CREATE TABLE rol (
	id_prota		integer			NOT NULL,
	id_escuela		integer			NOT NULL,
	fecha_ini		date			NOT NULL,
	id_evento		integer			NOT NULL,
	nombre			varchar(1)		NOT NULL
);

CREATE TABLE detalle_reserva (
	id_reserva		integer			NOT NULL,
	id_empresa		integer			NOT NULL,
	cantidad		integer			NOT NULL
);

CREATE TABLE entrada (
	ano				date			NOT NULL,
	id_evento		integer			NOT NULL,
	id_entrada		integer			NOT NULL,
	hora_emi		time			NOT NULL,
	f_emision		date			NOT NULL,
	id_reserva		integer			NOT NULL
);

CREATE TABLE historico_precio (
	id_empresa		integer			NOT NULL,
	id_tipo			integer			NOT NULL,
	ano	   			date			NOT NULL,
	id_evento	    integer			NOT NULL,
	id_entrada	   	integer			NOT NULL,
	fecha_inicio	date 			NOT NULL,
	costo_reales	integer			NOT NULL,
	fecha_fin		date
);