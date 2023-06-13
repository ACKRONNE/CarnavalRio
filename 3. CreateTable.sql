-- Crear Tablas

CREATE TABLE ama_clientes (
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

CREATE TABLE ama_lugares_evento (
	id_lugar		integer,
	nombre			varchar(10) 	NOT NULL,
	direccion		text			NOT NULL,
	PRIMARY KEY		(id_lugar)
);

CREATE TABLE ama_regiones_rio (
	id_region		integer,
	nombre			varchar(10) 	NOT NULL,
	descripcion		text,
	PRIMARY KEY		(id_region)
);

CREATE TABLE ama_empresas (
	id_empresa		integer,
	nombre			varchar(10) 	NOT NULL,
	correo			varchar(30)		NOT NULL,
	PRIMARY KEY		(id_empresa)
);

CREATE TABLE ama_autorizaciones (
	id_empresa 		integer,
	cant_max		integer			NOT NULL,
	PRIMARY KEY		(id_empresa)
);

CREATE TABLE ama_tipos_entrada (
	id_empresa		integer,
	id_tipo			integer			UNIQUE,
	tipo_ent		char(2)			NOT NULL,
	sector			integer			NOT NULL,
	calidad			integer			NOT NULL,
	tipo_des		char(1)			NOT NULL,
	ubi				char(2),
	PRIMARY KEY (id_empresa, id_tipo)	
);

CREATE TABLE ama_reserva (
	id_reserva		integer,
	f_h_emi			timestamp		NOT NULL,
	id_cliente		integer			NOT NULL,
	monto_reales	integer,
	fecha_pago		date,
	PRIMARY KEY		(id_reserva)		
);

CREATE TABLE ama_escuelas_samba (
	id_escuela 		integer,
	nombre_gres		varchar(30)		NOT NULL,
	fecha_funda		date			NOT NULL,
	direccion		text			NOT NULL,
	color			varchar(15)		NOT NULL,
	id_region		integer			NOT	NULL,
	PRIMARY KEY		(id_escuela)
);

CREATE TABLE ama_hist_grupo (
	id_escuela		integer,
	fecha_ini		date			UNIQUE,
	grupo			char(1)			NOT NULL,
	fecha_fin		date,
	PRIMARY KEY		(id_escuela,fecha_ini)
);

CREATE TABLE ama_protagonistas (
	id_prota		integer,
	nombre			varchar(10)		NOT NULL,
	apellido1		varchar(10)		NOT NULL,
	apellido2		varchar(10)		NOT NULL,
	genero			char(1)			NOT NULL,
	fecha_nac		date			NOT NULL,
	dni				integer			NOT NULL		UNIQUE,
	id_escuela		integer,
	PRIMARY KEY		(id_prota)
);

CREATE TABLE ama_carnavales_anual (
	ano				date,
	fecha_ini		date			NOT NULL,
	fecha_fin		date			NOT NULL,
	id_prota		integer			NOT NULL,
	PRIMARY KEY		(ano)
);

CREATE TABLE ama_eventos (
	ano 			date,
	id_evento		integer			UNIQUE,
	tipo			char(1)			NOT NULL,
	fecha_ini		date			NOT NULL,
	hora_ini		time			NOT NULL,
	tipo_audi		varchar(3)		NOT NULL,
	pago			char(1)			NOT NULL,
	descripcion		text,
	costo_reales	integer,
	id_lugar		integer,
	PRIMARY KEY (ano, id_evento)
);

CREATE TABLE ama_participacion (
	id_escuela		integer,
	fecha_ini		date,
	id_evento		integer,
	hora_ini		time			NOT NULL,
	orden_des		integer			NOT NULL,
	posicion_fin	integer			NOT NULL,
	tema_gen		varchar(20)		NOT NULL,
	titu_letr		text			NOT NULL,
	PRIMARY KEY (id_escuela, fecha_ini, id_evento)
);

CREATE TABLE ama_rol (
	id_prota		integer,
	id_escuela		integer,
	fecha_ini		date,
	id_evento		integer			UNIQUE,
	nombre			varchar(1)		NOT NULL,
	PRIMARY KEY (id_prota, id_escuela, fecha_ini,id_evento)
);

CREATE TABLE ama_detalle_reserva (
	id_reserva		integer,
	id_empresa		integer,
	cantidad		integer			NOT NULL,
	PRIMARY KEY (id_reserva, id_empresa)
);

CREATE TABLE ama_entrada (
	ano				date,
	id_evento		integer,
	id_entrada		integer			UNIQUE,
	hora_emi		time			NOT NULL,
	f_emision		date			NOT NULL,
	id_reserva		integer			NOT NULL,
	PRIMARY KEY (ano, id_evento, id_entrada)
);

CREATE TABLE ama_historico_precio (
	id_empresa		integer,
	id_tipo			integer,
	ano	   			date,
	id_evento	    integer,
	id_entrada	   	integer,
	fecha_inicio	date,
	costo_reales	integer			NOT NULL,
	fecha_fin		date,
	PRIMARY KEY (id_empresa, id_tipo, ano, id_evento, id_entrada, fecha_inicio)
);