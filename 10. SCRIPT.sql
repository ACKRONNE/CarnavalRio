
-- C R E A R  T A B L A S

CREATE TABLE ama_clientes (
	id_cliente		SERIAL,
	nombre			varchar(10) 	NOT NULL,
	apellido1		varchar(10)		NOT NULL,
	nacionalidad	char			NOT NULL		CHECK (nacionalidad IN ('n', 'e')),
	fecha_nac		date			NOT NULL,		
	dni				integer			NOT NULL		UNIQUE,
	correo			varchar(30)		NOT NULL		UNIQUE,
	apellido2		varchar(10),
	CONSTRAINT 		pk_clie			PRIMARY KEY		(id_cliente)		
);

CREATE TABLE ama_lugares_evento (
	id_lugar		SERIAL,
	nombre			varchar(10) 	NOT NULL,
	direccion		text			NOT NULL,
	CONSTRAINT 		pk_luga			PRIMARY KEY		(id_lugar)
);

CREATE TABLE ama_regiones_rio (
	id_region		SERIAL,
	nombre			varchar(10) 	NOT NULL,
	descripcion		text,
	CONSTRAINT 		pk_reri			PRIMARY KEY		(id_region)
);

CREATE TABLE ama_empresas (
	id_empresa		SERIAL,
	nombre			varchar(21) 	NOT NULL		UNIQUE,
	correo			varchar(30)		NOT NULL		UNIQUE,
	CONSTRAINT 		pk_empe			PRIMARY KEY		(id_empresa)
);

-- S O L O  U N A (1)  F O R E I N G  K E Y

CREATE TABLE ama_autorizaciones (
	id_empresa 		SERIAL,
	cant_max		integer			NOT NULL,
	CONSTRAINT 		pk_auto			PRIMARY KEY		(id_empresa)
);

CREATE TABLE ama_tipos_entradas (
	id_empresa		integer,
	id_tipo			SERIAL			UNIQUE,
	tipo_ent		char			NOT NULL		CHECK (tipo_ent IN ('gp','gf','an','sl')),
	sector			integer			NOT NULL		CHECK ((sector >= 1) AND (sector <= 11)),
	calidad			integer			NOT NULL		CHECK ((calidad >= 1) AND (calidad <= 11)),
	tipo_des		char			NOT NULL		CHECK (tipo_des IN ('e', 'c', 'a')),
	ubi				char							CHECK (ubi IN ('a', 'b','c', 'a/b', 'c/d')),
	descripcion		text,
	CONSTRAINT 		pk_tien			PRIMARY KEY (id_empresa, id_tipo)	
);

CREATE TABLE ama_reservas (
	id_reservas		SERIAL,
	f_h_emi			timestamp		NOT NULL,
	id_cliente		integer			NOT NULL		UNIQUE,
	monto_reales	real,
	fecha_pago		date,
	CONSTRAINT 		pk_rese			PRIMARY KEY		(id_reservas)		
);

CREATE TABLE ama_escuelas_samba (
	id_escuela 		SERIAL,
	nombre_gres		varchar(30)		NOT NULL,
	fecha_funda		date			NOT NULL,
	direccion		text			NOT NULL,
	color			varchar(15)		NOT NULL,
	resumen_hist	text			NOT NULL,
	id_region		integer			NOT	NULL		UNIQUE,
	CONSTRAINT 		pk_escu			PRIMARY KEY		(id_escuela)
);

CREATE TABLE ama_hist_grupos (
	id_escuela		SERIAL,
	fecha_ini		date							UNIQUE,
	grupos			char			NOT NULL		CHECK (grupos IN ('a','e')),
	fecha_fin		date,
	CONSTRAINT 		pk_higr			PRIMARY KEY		(id_escuela,fecha_ini)
);

CREATE TABLE ama_protagonistas (
	id_prota		SERIAL,
	nombre			varchar(10)		NOT NULL,
	apellido1		varchar(10)		NOT NULL,
	genero			char			NOT NULL		CHECK (genero IN ('f','m')),
	fecha_nac		date			NOT NULL,
	dni				integer			NOT NULL		UNIQUE,
	id_escuela		integer							UNIQUE,
	apellido2		varchar(10),
	CONSTRAINT 		pk_prot			PRIMARY KEY		(id_prota)
);

-- D O S  O  M A S  F K

CREATE TABLE ama_carnavales_anuales (
	ano				date,
	fecha_ini		date			NOT NULL,
	fecha_fin		date			NOT NULL,
	id_prota		integer			NOT NULL,
	CONSTRAINT 		pk_carn			PRIMARY KEY		(ano)
);

CREATE TABLE ama_eventos (
	ano 			date,
	id_evento		SERIAL			UNIQUE,
	tipo			char(1)			NOT NULL,
	fecha_ini		date			NOT NULL,
	hora_ini		time			NOT NULL,					
	tipo_audi		varchar(3)		NOT NULL		CHECK (tipo IN ('g','d')),
	pago			char(1)			NOT NULL		CHECK (pago IN ('s','n'))		DEFAULT 'n',
	descripcion		text,
	costo_reales	real,
	id_lugar		integer							UNIQUE,
	CONSTRAINT 		pk_even			PRIMARY KEY (ano, id_evento)
);

CREATE TABLE ama_participaciones (
	id_escuela		SERIAL,
	fecha_ini		date,
	id_evento		SERIAL,
	hora_ini		time			NOT NULL,
	orden_des		integer			NOT NULL,
	posicion_fin	integer			NOT NULL,
	tema_gen		varchar(20)		NOT NULL,
	titu_letr		text			NOT NULL,
	CONSTRAINT 		pk_part			PRIMARY KEY (id_escuela, fecha_ini, id_evento)
);

CREATE TABLE ama_roles (
	id_prota		SERIAL,
	id_escuela		SERIAL,
	fecha_ini		date,
	id_evento		SERIAL			UNIQUE,
	nombre			varchar(1)		NOT NULL		CHECK (nombre IN ('c','m','p')),
	CONSTRAINT 		pk_rol			PRIMARY KEY (id_prota, id_escuela, fecha_ini,id_evento)
);

CREATE TABLE ama_detalles_reservas (
	id_reservas		SERIAL,
	id_empresa		SERIAL,
	cantidad		integer			NOT NULL,
	CONSTRAINT 		pk_dere			PRIMARY KEY (id_reservas, id_empresa)
);

CREATE TABLE ama_entradas (
	ano				date,
	id_evento		SERIAL,
	id_entrada		SERIAL			UNIQUE,
	hora_emi		time			NOT NULL,
	f_emision		date			NOT NULL,
	id_reservas		SERIAL			UNIQUE,
	CONSTRAINT 		pk_entr			PRIMARY KEY (ano, id_evento, id_entrada)
);

CREATE TABLE ama_historicos_precios (
	id_empresa		SERIAL,
	id_tipo			SERIAL,
	ano	   			date,
	id_evento	    SERIAL,
	id_entrada	   	SERIAL,
	fecha_inicio	date,
	costo_reales	real			NOT NULL,
	fecha_fin		date,
	CONSTRAINT 		pk_hipr			PRIMARY KEY (id_empresa, id_tipo, ano, id_evento, id_entrada, fecha_inicio)
);

-- M O D I F I C A C I O N  D E  T A B L A S

ALTER TABLE ama_autorizaciones
ADD CONSTRAINT fka_auto_emp     FOREIGN KEY     (id_empresa)    REFERENCES  ama_empresas (id_empresa);

ALTER TABLE ama_tipos_entradas
ADD CONSTRAINT fkt_emp_tip      FOREIGN KEY     (id_empresa)    REFERENCES  ama_empresas (id_empresa);

ALTER TABLE ama_reservas
ADD CONSTRAINT fkr_reser        FOREIGN KEY    (id_cliente)     REFERENCES ama_clientes(id_cliente);

ALTER TABLE ama_escuelas_samba
ADD CONSTRAINT fkes_escu        FOREIGN KEY    (id_region)      REFERENCES ama_regiones_rio(id_region);

ALTER TABLE ama_hist_grupos
ADD CONSTRAINT fkhg_idesc 		FOREIGN KEY    (id_escuela)     REFERENCES ama_escuelas_samba(id_escuela);

ALTER TABLE ama_protagonistas
ADD CONSTRAINT fkp_idesc        FOREIGN KEY    (id_escuela)     REFERENCES ama_escuelas_samba(id_escuela);

ALTER TABLE ama_carnavales_anuales
ADD CONSTRAINT fkca_prota       FOREIGN KEY    (id_prota)       REFERENCES ama_protagonistas(id_prota);

ALTER TABLE ama_eventos
ADD CONSTRAINT fkev_ano         FOREIGN KEY    (ano)            REFERENCES ama_carnavales_anuales(ano),
ADD CONSTRAINT fkev_lug         FOREIGN KEY    (id_lugar)       REFERENCES ama_lugares_evento(id_lugar);

ALTER TABLE ama_participaciones
ADD CONSTRAINT fkpa_idesc       FOREIGN KEY (id_escuela)        REFERENCES ama_escuelas_samba(id_escuela),
ADD CONSTRAINT fkpa_fini        FOREIGN KEY (fecha_ini)         REFERENCES ama_hist_grupos(fecha_ini),
ADD CONSTRAINT fkpa_idev        FOREIGN KEY (id_evento)         REFERENCES ama_eventos(id_evento);

ALTER TABLE ama_roles
ADD CONSTRAINT fkro_idpro       FOREIGN KEY (id_prota)          REFERENCES ama_protagonistas(id_prota),
ADD CONSTRAINT fkro_idesc       FOREIGN KEY (id_escuela)        REFERENCES ama_escuelas_samba(id_escuela),
ADD CONSTRAINT fkro_fini        FOREIGN KEY (fecha_ini)         REFERENCES ama_hist_grupos(fecha_ini),
ADD CONSTRAINT fkro_ideve       FOREIGN KEY (id_evento)         REFERENCES ama_eventos(id_evento);

ALTER TABLE ama_detalles_reservas
ADD CONSTRAINT fkde_idres       FOREIGN KEY (id_reservas)       REFERENCES ama_reservas(id_reservas),
ADD CONSTRAINT fkde_idemp       FOREIGN KEY (id_empresa)        REFERENCES ama_empresas(id_empresa);

ALTER TABLE ama_entradas
ADD CONSTRAINT fken_ano         FOREIGN KEY (ano)               REFERENCES ama_carnavales_anuales(ano),
ADD CONSTRAINT fken_ideve       FOREIGN KEY (id_evento)         REFERENCES ama_eventos(id_evento),
ADD CONSTRAINT fken_idres       FOREIGN KEY (id_reservas)       REFERENCES ama_reservas(id_reservas);

ALTER TABLE ama_historicos_precios
ADD CONSTRAINT fkhp_idemp       FOREIGN KEY (id_empresa)        REFERENCES ama_empresas(id_empresa),
ADD CONSTRAINT fkhp_idtip       FOREIGN KEY (id_tipo)           REFERENCES ama_tipos_entradas(id_tipo),
ADD CONSTRAINT fkhp_ano         FOREIGN KEY (ano)               REFERENCES ama_carnavales_anuales(ano),
ADD CONSTRAINT fkhp_ideve       FOREIGN KEY (id_evento)         REFERENCES ama_eventos(id_evento),
ADD CONSTRAINT fkhp_ident       FOREIGN KEY (id_entrada)        REFERENCES ama_entradas(id_entrada);

-- I N D I C E S  D E  F K 

CREATE INDEX in_rese ON ama_reservas (id_cliente);
CREATE INDEX in_escu ON ama_escuelas_samba (id_region);
CREATE INDEX in_prot ON ama_protagonistas (id_escuela);
CREATE INDEX in_carn ON ama_carnavales_anuales (id_prota);
CREATE INDEX in_even ON ama_eventos (id_lugar);
CREATE INDEX in_entr ON ama_entradas (id_reservas);

-- I N S E R C I O N


INSERT INTO ama_clientes 
VALUES(DEFAULT,'Manuel','Fernandez','n','1990-01-10',345346456,'manuel.fernandez@gmail.com','Garcia'),					
      (DEFAULT,'Nicolas','Setien','e','1985-07-22',987654321,'nicolas.setien@hotmail.com','Sandoval'),					
      (DEFAULT,'Andrea','Rodriguez','n','1992-03-15',456789012,'andrea.fernandez@outlook.com','Fernandez'),					
      (DEFAULT,'Paul','Ramirez','n','1988-11-05',321098765,'paul.ramirez@gmail.com','Santos'),					
      (DEFAULT,'Carlos','Gonzalez','e','1996-09-18',210987654,'carlos.gonzalez@apple.com','Perez'),					
      (DEFAULT,'Gabriela','Ortiz','n','1989-04-03',876543210,'gabriela.ortiz@hotmail.com','Gomez'),					
      (DEFAULT,'Ricardo','Morales','n','1997-12-16',234567890,'ricardo.morales@outlook.com','Hernandez'),					
      (DEFAULT,'Luis','Mendez','e','1993-08-07',543210987,'luis.mendez@apple.com','Reyes'),					
      (DEFAULT,'Alejandro','Vargas','n','1991-02-28',789012345,'alejandro.vargas@gmail.com','Mendoza'),					
      (DEFAULT,'Manuel','Flores','e','1998-12-10',890123456,'manuel.flores@apple.com','Lopez'),					
      (DEFAULT,'Carolina','Ramos','n','1996-07-29',456289012,'carolina.ramos@outlook.com','Morales');		