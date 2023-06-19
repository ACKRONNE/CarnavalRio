-- C R E A R  T A B L A S

CREATE TABLE ama_clientes (
	id_cliente		SERIAL,
	nombre		varchar(10) 	NOT NULL,
	apellido1		varchar(10)		NOT NULL,
	nacionalidad	char			NOT NULL		CHECK (nacionalidad IN ('n','e')),
	fecha_nac		date			NOT NULL,		
	dni			integer		NOT NULL		UNIQUE,
	correo		varchar(30)		NOT NULL		UNIQUE,
	apellido2		varchar(10),
	CONSTRAINT 		pk_clie		PRIMARY KEY		(id_cliente)		
);

CREATE TABLE ama_lugares_evento (
	id_lugar		SERIAL,
	nombre		text 			NOT NULL,
	direccion		text			NOT NULL,
	CONSTRAINT 		pk_luga		PRIMARY KEY		(id_lugar)
);

CREATE TABLE ama_regiones_rio (
	id_region		SERIAL,
	nombre		text 			NOT NULL,
	descripcion		text,
	CONSTRAINT 		pk_reri		PRIMARY KEY		(id_region)
);

CREATE TABLE ama_empresas (
	id_empresa		SERIAL,
	nombre		varchar(21) 	NOT NULL		UNIQUE,
	correo		varchar(30)		NOT NULL		UNIQUE,
	CONSTRAINT 		pk_empe		PRIMARY KEY		(id_empresa)
);

-- S O L O  U N A (1)  F O R E I N G  K E Y

CREATE TABLE ama_autorizaciones (
	id_empresa 		SERIAL,
	cant_max		integer		NOT NULL,
	CONSTRAINT 		pk_auto		PRIMARY KEY		(id_empresa)
);

CREATE TABLE ama_tipos_entradas (
	id_empresa		integer,
	id_tipo		SERIAL		            	UNIQUE,
	tipo_ent		varchar(2)		NOT NULL		CHECK (tipo_ent IN ('gp','gf','an','sl')),
	sector		integer		NOT NULL		CHECK ((sector >= 1) AND (sector <= 11)),
	calidad		integer		NOT NULL		CHECK ((calidad >= 1) AND (calidad <= 11)),
	tipo_des		char			NOT NULL		CHECK (tipo_des IN ('e', 'c', 'a')),
	ubi			varchar(3)					CHECK (ubi IN ('a', 'b','c', 'a/b', 'c/d')),
	descripcion		text,
	CONSTRAINT 		pk_tien		PRIMARY KEY (id_empresa, id_tipo)	
);

CREATE TABLE ama_reservas (
	id_reservas		SERIAL,
	f_h_emi		timestamp		NOT NULL,
	id_cliente		integer		NOT NULL		UNIQUE,
	monto_reales	real,
	fecha_pago		date,
	CONSTRAINT 		pk_rese		PRIMARY KEY		(id_reservas)		
);

CREATE TABLE ama_escuelas_samba (
	id_escuela 		SERIAL,
	nombre_gres		text			NOT NULL,
	fecha_funda		date			NOT NULL,
	direccion		text			NOT NULL,
	color			text			NOT NULL,
	resumen_hist	text			NOT NULL,
	id_region		integer		NOT NULL,
	CONSTRAINT 		pk_escu		PRIMARY KEY		(id_escuela)
);

CREATE TABLE ama_hist_grupos (
	id_escuela		integer,
	id_histg		SERIAL			            UNIQUE,
	fecha_ini		date,
	grupos		char			NOT NULL		CHECK (grupos IN ('a','e')),
	fecha_fin		date			UNIQUE,
	CONSTRAINT 		pk_higr		PRIMARY KEY		(id_escuela,id_histg)
);

CREATE TABLE ama_protagonistas (
	id_prota		SERIAL,
	nombre		varchar(15)		NOT NULL,
	apellido1		varchar(15)		NOT NULL,
	genero		char			NOT NULL		CHECK (genero IN ('f','m')),
	fecha_nac		date			NOT NULL,
	dni			integer		NOT NULL		UNIQUE,
	id_escuela		integer,
	apellido2		varchar(15),
	CONSTRAINT 		pk_prot		PRIMARY KEY		(id_prota)
);

-- D O S  O  M A S  F K

CREATE TABLE ama_carnavales_anuales (
	ano			integer,
	fecha_ini		date			NOT NULL,
	fecha_fin		date			NOT NULL,
	id_momo		integer		NOT NULL,
	id_reina		integer		NOT NULL,
	CONSTRAINT 		pk_carn		PRIMARY KEY		(ano)
);

CREATE TABLE ama_eventos (
	ano 			integer,
	id_evento		SERIAL		UNIQUE,
	tipo			char			NOT NULL		CHECK (tipo IN ('g','d')),
	fecha_ini		date			NOT NULL,
	hora_ini		time			NOT NULL,					
	tipo_audi		integer		NOT NULL,
	pago			char			NOT NULL		CHECK (pago IN ('s','n'))		DEFAULT 'n',
	descripcion		text,
	costo_reales	real,
	id_lugar		integer,
	CONSTRAINT 		pk_even		PRIMARY KEY (ano, id_evento)
);

CREATE TABLE ama_participaciones (
	id_escuela		integer,
	id_histg		integer,
	id_evento		integer,
	hora_ini		time			NOT NULL,
	orden_des		integer		NOT NULL,
	posicion_fin	integer		NOT NULL,
	tema_gen		text			NOT NULL,
	titu_letr		text			NOT NULL,
	CONSTRAINT 		pk_part		PRIMARY KEY (id_escuela, id_histg, id_evento)
);

CREATE TABLE ama_roles (
	id_prota		integer,
	id_escuela		integer,
	id_histg		integer,
	id_evento		integer,
	nombre		varchar		NOT NULL          CHECK (nombre IN ('rey momo','reina del carnaval','carnavalesco','mestre-sala','porta-bandeira')),
	CONSTRAINT 		pk_rol		PRIMARY KEY (id_prota, id_escuela, id_histg,id_evento)
);

CREATE TABLE ama_detalles_reservas (
	id_reservas		integer,
	id_empresa		integer,
	cantidad		integer		NOT NULL,
	CONSTRAINT 		pk_dere		PRIMARY KEY (id_reservas, id_empresa)
);

CREATE TABLE ama_entradas (
	ano			integer,
	id_evento		integer,
	id_entrada		SERIAL		UNIQUE,
	hora_emi		time			NOT NULL,
	f_emision		date			NOT NULL,
	id_reservas		integer		UNIQUE,
	CONSTRAINT 		pk_entr		PRIMARY KEY (ano, id_evento, id_entrada)
);

CREATE TABLE ama_historicos_precios (
	id_empresa		integer,
	id_tipo		integer,
	ano	   		integer,
	id_evento	      integer,
	id_entrada	   	integer,
	fecha_inicio	date,
	costo_reales	real			NOT NULL,
	fecha_fin		date,
	CONSTRAINT 		pk_hipr		PRIMARY KEY (id_empresa, id_tipo, ano, id_evento, id_entrada, fecha_inicio)
);

-- M O D I F I C A C I O N  D E  T A B L A S
-- Los nombres de las fk no tienen nuestras iniciales porque 
-- Tienen nombres largos para poder identificar correctamente el objeto
ALTER TABLE ama_autorizaciones  
ADD CONSTRAINT fka_auto_emp     FOREIGN KEY     (id_empresa)    REFERENCES  ama_empresas (id_empresa);

ALTER TABLE ama_tipos_entradas
ADD CONSTRAINT fkt_emp_tip      FOREIGN KEY     (id_empresa)    REFERENCES  ama_empresas (id_empresa);

ALTER TABLE ama_reservas
ADD CONSTRAINT fkr_reser        FOREIGN KEY    (id_cliente)     REFERENCES ama_clientes(id_cliente);

ALTER TABLE ama_escuelas_samba
ADD CONSTRAINT fkes_escu        FOREIGN KEY    (id_region)      REFERENCES ama_regiones_rio(id_region);

ALTER TABLE ama_hist_grupos
ADD CONSTRAINT fkhg_idesc 	  FOREIGN KEY    (id_escuela)     REFERENCES ama_escuelas_samba(id_escuela);

ALTER TABLE ama_protagonistas
ADD CONSTRAINT fkp_idesc        FOREIGN KEY    (id_escuela)     REFERENCES ama_escuelas_samba(id_escuela);

ALTER TABLE ama_carnavales_anuales
ADD CONSTRAINT fkca_momo        FOREIGN KEY    (id_momo)        REFERENCES ama_protagonistas(id_prota),
ADD CONSTRAINT fkca_reina       FOREIGN KEY    (id_reina)       REFERENCES ama_protagonistas(id_prota);

ALTER TABLE ama_eventos
ADD CONSTRAINT fkev_ano         FOREIGN KEY    (ano)            REFERENCES ama_carnavales_anuales(ano),
ADD CONSTRAINT fkev_lug         FOREIGN KEY    (id_lugar)       REFERENCES ama_lugares_evento(id_lugar);

ALTER TABLE ama_participaciones
ADD CONSTRAINT fkpa_idesc       FOREIGN KEY (id_escuela)        REFERENCES ama_escuelas_samba(id_escuela),
ADD CONSTRAINT fkpa_idhistg     FOREIGN KEY (id_histg)          REFERENCES ama_hist_grupos(id_histg),
ADD CONSTRAINT fkpa_idev        FOREIGN KEY (id_evento)         REFERENCES ama_eventos(id_evento);

ALTER TABLE ama_roles
ADD CONSTRAINT fkro_idpro       FOREIGN KEY (id_prota)          REFERENCES ama_protagonistas(id_prota),
ADD CONSTRAINT fkro_idesc       FOREIGN KEY (id_escuela)        REFERENCES ama_escuelas_samba(id_escuela),
ADD CONSTRAINT fkro_idhistg     FOREIGN KEY (id_histg)          REFERENCES ama_hist_grupos(id_histg),
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

-- I N D I C E S 

CREATE INDEX ama_inre ON ama_reservas (id_cliente);
CREATE INDEX ama_ines ON ama_escuelas_samba (id_region);
CREATE INDEX ama_inpr ON ama_protagonistas (id_escuela);
CREATE INDEX ama_inmo ON ama_carnavales_anuales (id_momo);
CREATE INDEX ama_inca ON ama_carnavales_anuales (id_reina);
CREATE INDEX ama_inev ON ama_eventos (id_lugar);
CREATE INDEX ama_inen ON ama_entradas (id_reservas);

-- I N S E R C C I O N  D E  D A T O S

BEGIN;

INSERT INTO ama_clientes 
VALUES(150,'Manuel','Fernandez','n','1990-01-10',345346456,'manuel.fernandez@gmail.com','Garcia'),
      (151,'Nicolas','Setien','e','1985-07-22',987654321,'nicolas.setien@hotmail.com','Sandoval'),
      (152,'Andrea','Rodriguez','n','1992-03-15',456789012,'andrea.fernandez@outlook.com','Fernandez'),
      (153,'Paul','Ramirez','n','1988-11-05',321098765,'paul.ramirez@gmail.com','Santos'),
      (154,'Carlos','Gonzalez','e','1996-09-18',210987654,'carlos.gonzalez@apple.com','Perez'),
      (155,'Gabriela','Ortiz','n','1989-04-03',876543210,'gabriela.ortiz@hotmail.com','Gomez'),
      (156,'Ricardo','Morales','n','1997-12-16',234567890,'ricardo.morales@outlook.com','Hernandez'),
      (157,'Luis','Mendez','e','1993-08-07',543210987,'luis.mendez@apple.com','Reyes'),
      (158,'Alejandro','Vargas','n','1991-02-28',789012345,'alejandro.vargas@gmail.com','Mendoza'),
      (159,'Manuel','Flores','e','1998-12-10',890123456,'manuel.flores@apple.com','Lopez'),
      (160,'Carolina','Ramos','n','1996-07-29',456289012,'carolina.ramos@outlook.com','Morales');						

INSERT INTO ama_lugares_evento 
VALUES(100,'Baile Magico','Avenida Atlântica 1702, Hotel Copacabana Palace'),
      (101,'Grupo especial','Sambódromo Profesor Darcy Ribeiro'),
      (102,'Baile Gay del Scala','Scala nigth Club. Avenida Treze de Maio 23, Centro'),
      (103,'The City Ball','Rua 13 de Maio, 23, Centro de Río de Janeiro.'),
      (104,'Bola Preta Ball','Scala nigth Club. Avenida Treze de Maio 23, Centro'),
      (105,'Grupo de Acceso','Sambódromo Profesor Darcy Ribeiro'),
      (106,'Beer Ball','Scala Rio Nightclub: Avenida Treze de Maio 23, Centro'),
      (107,'Desfile del Bloque Noivas Do Parú','Praia de Itaguaçu'),
      (108,'Desfile de Campeones','Sambódromo Profesor Darcy Ribeiro');

INSERT INTO ama_regiones_rio 
VALUES(71,'Region metropolitana','Abarca 20 municipios.'),
      (72,'Zona Norte','Ubicada en el Norte del Macizo de Tijuca, al sur de la Baxiada Fluminende y al oeste de la Bahia de Guanabara'),
      (73,'Zona Oeste','Cubre 12 barrios'),
      (74,'Region Sudeste','es la segunda region mas pequeña del pais'),
      (75,'Zona Central','Esta dividido por la Avenida Presidente Vargas, la principal avenida de la Region Central'),
      (76,'Zona Sur','Cubre 12 barrios, tiene 639.522 poblacion'),
      (77,'Region Noredeste','Contiene 9 estados');

INSERT INTO ama_empresas 
VALUES(161,'Bookers International','info@bookersinternational.com'),
      (162,'Rio Maximo','info@riomaximo.com'),
      (163,'Rio ticket','Info@rio-Tickets.com'),
      (164,'Carnavales Brasil','info@carnavales-brasil.com'),
      (165,'Rio Carnaval Tickets','riocarnavaltickets@gmail.com'),
      (166,'Trip advisor','northamericapr@tripadvisor.com'),
      (167,'Ticket Rio','atendimento@ticketrio.com.br'),
      (168,'Rio','info@riocarnaval.com'),
      (169,'Viator','viatortravel');

INSERT INTO ama_autorizaciones 
VALUES(161,5000),
      (162,2500),
      (163,2000),
      (164,3000),
      (165,5000),
      (166,1000),
      (167,1500),
      (168,2000),
      (169,5000);

INSERT INTO ama_tipos_entradas 
VALUES(161,171,'sl',2,1,'e','a'),
      (162,172,'gf',4,5,'c','c/d'),
      (163,173,'an',6,6,'a','c'),
      (164,174,'sl',2,2,'c','b'),
      (165,175,'sl',2,2,'e','b'),
      (166,176,'an',6,6,'c','c'),
      (167,177,'gp',7,8,'a','b'),
      (168,178,'sl',2,1,'c','a'),
      (169,179,'sl',2,3,'e','c');

INSERT INTO ama_reservas 
VALUES(180,'2011-01-15',150,1000.25,'2011-02-05'),
      (181,'2012-06-30',151,2500.75,'2012-07-15'),
      (182,'2013-04-12',152,1200.60,'2013-05-05'),
      (183,'2012-09-02',153,800.35,'2012-09-20'),
      (184,'2011-08-25',154,600.90,'2011-09-10'),
      (185,'2012-11-09',155,1500.20,'2012-11-30'),
      (186,'2013-07-17',156,300.75,'2013-08-05'),
      (187,'2011-03-22',157,700.45,'2011-04-10'),
      (188,'2013-10-14',158,1800.30,'2013-10-30');

INSERT INTO ama_escuelas_samba 
VALUES(1,'Beija-Flor','1948-12-25','Centro de Nilopolis','azul y blanco','es una escuela de samba brasileña del municipio deNilópolis, pero que lleva muchos años participando en el Carnaval de la ciudad de Río de Janeiro. Con catorce logros, la escuela asume la tercera mayor ganadora en el rol de los campeones del carnaval de Río de Janeiro, siendo la que más ganó en la "era sambódromo".',71),
      (2,'Unidos da Tijuca','1931-12-31','Tijuca','amarillo y azul','es una escuela de samba en la ciudad de Río de Janeiro, Tiene 4 títulos de campeón del Grupo Especial del carnaval carioca',72),
      (3,'Primera Estacion de Manguera','1928-04-28','Mangueira','verde y rosa','es una escuela de samba tradicional brasileña de la ciudad de Río de Janeiro, ocupa la posición de segundo mayor ganador en la lista de campeones del carnaval de Río de Janeiro',72),
      (4,'Unidos de Vila Isabel','1946-04-04','Vila Isabel','banco y azul','es una de las escuelas de samba más tradicionales de la ciudad de Río de Janeiro, fue campeona del Grupo Especial Carnaval en 1988, 2006 y 2013.',72),
      (5,'Academicos del Salgueiro','1953-03-05','Pandeiro','rojo y blanco','es una de las escuelas de samba más tradicionales de la ciudad de Río de Janeiro. Tiene nueve títulos de campeón del Grupo Especial del Carnaval de Río. la posición de cuarto mayor ganador en la lista de campeones del carnaval de Río de Janeiro.',72),
      (6,'Emperatriz Leopoldinense','1959-03-06','Ramos','verde, blanco, dorado','es una escuela de samba de la ciudad de Rio de Janeiro, Imperatriz Leopoldinense es poseedora de nueve títulos de campeona del grupo principal del carnaval carioca, siendo que en 1980, 1989 y 2001 fue campeona obteniendo la máxima puntuación en todos los aspectos',72),
      (7,'Juventud Independiente de Padre Miguel','1955-11-10','Padre Miguel','verde, blanco, amarillo','es una escuela de samba en la ciudad de Río de Janeiro. Dueña de seis logros (1979, 1985, 1990, 1991, 1996, 2017), la escuela se ubica como la séptima mayor ganadora del Carnaval de Campeones del Carnaval de Río de Janeiro.',73),
      (8,'Unidos del Puerto de la Piedra','1978-03-08','Porto da Piedra','rojo, blanco','La asociación fue creada a partir de un equipo de fútbol. En Río, nunca ganó el título de campeona del grupo principal. Ya en São Gonçalo, fue campeona una vez, en el año 1982',74),
      (9,'San Clemente','1961-01-25','Cidade Nova','negro, amarillo','es una escuela de samba brasileña de la ciudad de Río de Janeiro,u mejor colocación en el Grupo Especial del Carnaval fue el 6o lugar en 1990 con la trama "E o Samba Sambou" que criticaba la mercantilización del carnaval. En 2021, la escuela completa 23 participaciones entre las grandes escuelas del Grupo Especial, siendo que, por 11 veces consecutivas, entre 2011 y 2021.',75),
      (10,'Academicos del Gran Rio','1988-09-22','Centro de Duqe de Caxias','verde, blanco, rojo','es una escuela de samba brasileña del municipio de Duque de Caxias, que desfila en el carnaval de la ciudad de Río de Janeiro, más precisamente en el Grupo Especial. Fue campeona del Grupo Especial del Carnaval por primera vez en la historia en 2022. También fue subcampeona en 2006, 2007, 2010 y 2020. La exaltación a la región amazónica ha sido recurrente en sus desfiles, inspirando las tramas de 1995, 1997, 2006 y 2008.',71),
      (11,'Portela','1923-04-11','Madureira','azul, blanco','es una escuela de samba brasileña de la ciudad de Río de Janeiro. Portela es la mayor campeona del carnaval de Río de Janeiro, con 22 títulos',72),
      (12,'Union de la Isla del Gobernador','1953-03-07','Cacuia','azul, blanco, rojo','es una escuela de samba de la ciudad de Río de Janeiro, campeona del grupo de acceso en dos ocasiones',72),
      (13,'Renascer de Jacarepagua','1992-08-02','Tanque','rojo, blanco','es una escuela de samba en la ciudad de Río de Janeiro. campeón del grupo de acceso en el 2011',73),
      (14,'Unidos de Viradouro','1946-06-24','Barreto','rojo, blanco','es una escuela de samba brasileña, fue dos veces campeona del Grupo Especial',71),
      (15,'Estacio de Sa','1955-02-27','Estacio','rojo, blanco','es una escuela de samba brasileña de la ciudad de Río de Janeiro. Tiene el título de campeón del Grupo Especial de Río de Janeiro, conquistado en 1992, con el argumento "Paulicéia Desvairada - 70 años de Modernismo". También ganó siete veces la segunda división del carnaval carioca y dos veces la tercera división.',75),
      (16,'Academicos de Cubango','1959-12-17','Cubango','verde, blanco','es una escuela de samba brasileña de la ciudad de Niterói, que desde los años ochenta participa del carnaval de Río,',71),
      (17,'Academicos de Santa Cruz','1959-02-18','Santa Cruz','verde, blanco','es una escuela de samba brasileña de la ciudad de Río de Janeiro. Poseen 5 Títulos de Segunda División',73),
      (18,'Imperio Serrano','1947-03-23','Madureira','verde, blanco','es una escuela de samba brasileña de la Zona Norte, Império Serrano es el cuarto mayor ganador de la juerga carioca, con nueve títulos de campeonato, También tiene cinco títulos de segunda división, Desfile por primera vez en 1948, siendo cuatro veces campeón en la primera cuatro desfiles que participaron',72),
      (19,'Imperio de Tijuca','1940-12-08','Tijuca','verde, blanco','es una escuela de samba brasileña de la ciudad de Río de Janeiro. Su mejor colocación fue un cuarto lugar, logrado en su desfile debut, en 1946.',72),
      (20,'Inocentes de Belford Roxo','1993-07-11','Parque Sao Vicente','azul, blanco, rojo','es una escuela de samba brasileña de la ciudad de Belford Roxo, que participa en el Carnaval de Río de Janeiro. un campeonato en segunda, tercera y cuarta división',71),
      (21,'Academicos de Rocinha','1988-03-30','Sao Conrado','blanco, azul, verde','es una escuela de samba brasileña de la ciudad de Río de Janeiro. Un campeonato de segunda división, 4 campeonatos de tercera división, un campeonato de cuarta división y un',76),
      (22,'Caprichosos de Pilares','1949-02-19','Pilares','azul royale, azul turquesa, Blanco','es una escuela de samba brasileña de la ciudad de Río de Janeiro. Su mejor ubicación en el Grupo Especial de Carnaval fue el 3er lugar en el Desfile Dominical en 1984.',72),
      (23,'Alegria de la Zona Sur','1992-06-28','Copacabana','rojo, blanco, dorado','es una escuela de samba en la ciudad de Río de Janeiro. su característica más fuerte en sus tramas es el uso de temas que tratan el tema de la negrura, un campeonato en tercera, cuarta, quinta y dos en sexta división',76),
      (24,'Paraiso de Tuiuti','1952-04-05','Sao Cristovao','azul, amarillo','Es una escuela de samba con sede en la ciudad de Río de Janeiro, Campeonato En Segunda División, Tres En Tercera División, Dos En Cuarta División',75),
      (25,'Union del Parque Curicica','1993-03-01','Curicica','azul, rojo, blanco','es una escuela de samba de la ciudad de Río de Janeiro, campeonato de cuarta división',73),
      (26,'Unidos de Padre Miguel','1957-11-12','Padre Miguel','rojo, blanco','es una escuela de samba en la ciudad de Río de Janeiro. Tiene seis campeonatos ganados en grupos de acceso.',73),
      (27,'Arranco','1973-03-21','Engenho de Dentro','azul, blanco','es una escuela de samba de la ciudad de Río de Janeiro, una vez campeona del grupo B',72),
      (28,'Sereno de Campo Grande','1996-02-12','Campo Grande','azul, blanco','es una escuela de samba de la ciudad de Río de Janeiro, campeona del grupo E en una ocasión',73),
      (29,'Union de Jacarepagua','1956-11-15','Aperto de mao','verde, blanco','es una escuela de samba de la ciudad de Rio de Janeiro, Campeon de la serie D en dos ocasiones',72),
      (30,'Tradicion','1984-10-01','Campinho','azul royal, azul turquesa, blanco, dorado, gris','es una escuela de samba de la ciudad de Río de Janeiro, fue campeona de segunda división en tres ocasiones. Su mejor ubicación en el grupo especial fue el sexto lugar en 1994.',72),
      (31,'Dificil es el nombre','1973-10-31','Pilares','rojo, blanco','es una escuela de samba de la ciudad de Río de Janeiro, campeona del grupo B en una ocasión',73),
      (32,'Juventud de Vicente Carvalho','1988-02-07','Aguia','verde, blanco','es una escuela de samba en la ciudad de Río de Janeiro. Cuenta con dos títulos de campeonato y tres subcampeonatos conseguidos en grupos de acceso. En 2002 ganó el Grupo D; y en 2007 Grupo C. Desfiló varias veces en Grupo B, nunca habiendo llegado a Serie A y Grupo Especial.',72),
      (33,'Academicos de la tranquilidad','1969-11-10','Largo da Batalha','azul, blanco','es una escuela de samba de la ciudad de Niterói, fue cuatro veces campeona del Grupo Especial del Carnaval de Niterói. También tuvo otros dos títulos en el Niteroi Access Group. En el carnaval de Río de Janeiro, ganó cuatro campeonatos en grupos de acceso.',71),
      (34,'Independientes de San Juan de Meriti','1975-03-26','Praca da Bandeira','azul, verde, blanco','es una escuela de samba de São João de Meriti, Campeona del grupo C, D y E',71),
      (35,'Lins Imperial','1963-03-07','Aguia','verde, rosa','es una escuela de samba brasileña de la ciudad de Río de Janeiro, un campeonato en segunda división y 4 campeonatos en tercera división',72),
      (36,'Infantes de Lins','1991-05-01','Lins de Vasconcelos','verde, rosa','es una escuela de samba infantil de la ciudad de Río de Janeiro. Campeon en el carnaval 2011 de la seccion infantil en la reedicion de la trama de samba Lins Imperial de 1991.',72),
      (37,'Nueva Generacion del Estacio de Sa','1992-10-12','Estacio','rojo, blanco','es una escuela de samba para niños de la ciudad de Río de Janeiro. Subampeon en el carnaval 2011 de la seccion infantil en la reedicion de la trama de 1992 de Estácio de Sá.',72),
      (38,'Inocentes de Caprichosos','1991-04-04','Pilares','azul royal, azul turquesa, blanco','es una escuela de samba para niños de la ciudad de Río de Janeiro. 3er lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 2004 de Caprichosos de Pilares.',72),
      (39,'Pimpolhos de la Gran Rio','2002-08-10','Centro','verde, blanco, rojo','es una escuela de samba infantil y una organización no gubernamental, ubicada en la Rua Conde de Porto Alegre, en el centro de Caxias. 4to lugar en el carnaval del 2011 de la seccion infantil en la trama de "...nuestros cuentos...".',71),
      (40,'Corazones Unidos del Ciep','1985-08-15','Mangueira','naranja, blanco, amarillo','es una escuela de samba para niños de la ciudad de Río de Janeiro.  5to lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1997 de Uniao da Ilha do Governador.',72),
      (41,'Desfiles de Guanabara','1996-06-06','Copacabana','azul, amarillo','es una escuela de samba para niños de la ciudad de Río de Janeiro. 6to lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1998 de Académicos de Santa Cruz.',76),
      (42,'Herederos de la Villa','1988-06-23','Coroa','azul claro, blanco','es una escuela de samba junior de la ciudad de Río de Janeiro. 7mo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1994 de Unidos de Vila Isabel.',72),
      (43,'Aprendices del Sauce','1989-10-03','Andarai','blanco, rojo','es la escuela de samba junior de Academicos do Salgueiro. ubicada en la misma dirección del bloque Salgueiro, en la Zona Norte de la ciudad de Río de Janeiro. 8vo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1969 de Academicos do Salgueiro.',77),
      (44,'Estrellita de la Juventud','1992-06-02','Padre Miguel','verde, blanco','es una escuela de samba para niños de la ciudad de Río de Janeiro. 9no lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 2002 de Mocidade.',73),
      (45,'Petizes da Penha','2002-06-26','Penha','verde, blanco','es una escuela de samba junior de la ciudad de Río de Janeiro. 10mo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 2006 de Flor da Mina do Andaraí.',72),
      (46,'La niña de Cabucu','1991-07-14','Lins de Vasconcelos','azul, blanco','es la escuela de samba juvenil de Unidos do Cabucu, ubicada en la Zona Norte de la ciudad de Río de Janeiro. 11vo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1988 de Unidos do Cabucu.',72),
      (47,'Hijos del Aguila','2001-07-31','Madureira','azul, blanco','es una escuela de samba para niños de la ciudad de Río de Janeiro. 12vo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1984 de Portela.',72),
      (48,'Imperio del Futuro','1983-08-05','Madureira','verde, blanco','es una escuela de samba junior de la ciudad de Río de Janeiro. 13vo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1972 de Império Serrano.',72),
      (49,'Manguera del mañana','1987-08-12','Mangueria','verde, rosa','es una escuela de samba junior de la ciudad de Río de Janeiro. 14vo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1994 de Mangueira.',72),
      (50,'Tijuquinha do Borel','2002-06-19','Tijuca','Amarillo, azul','es una escuela de samba junior de la ciudad de Río de Janeiro. 15vo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 2005 de Unidos da Tijuca.',72),
      (51,'Todavia hay niños en Vila Kennedy','1991-04-21','Vila Kennedy','rojo, blanco','es una escuela de samba para niños en la ciudad de Río de Janeiro. reeditó varias tramas de Portela en diferentes años de los carnavales. En 2015 realizó un desfile sobre el carnaval Juegos Olímpicos',73),
      (52,'Unidos de Vila Santa Tereza','1956-12-20','Rocha Miranda','azul, blanco, amarillo','es una destacada escuela de samba de Río de Janeiro, Brasil, fundada en 1960. Representa y celebra la cultura y tradiciones del barrio de Santa Tereza. Conocida por su pasión y energía, ha ganado reconocimiento en el carnaval carioca. Su batería y samba-enredo son emblemáticos. Realizan desfiles coloridos y coreografías elaboradas. Además del carnaval, se involucran en actividades comunitarias y promueven la inclusión social. Unidos de Vila Santa Tereza es un símbolo de identidad y una fuente de inspiración para su comunidad.',72),
      (53,'Miel del futuro','2003-11-06','Maria de Gracia','negro, amarillo','es una escuela de samba para niños de la ciudad de Río de Janeiro. Fue la tercera escuela en desfilar en 2012 con una reedición de Imperatriz, la samba de 1999.',72);

INSERT INTO ama_hist_grupos 
VALUES(9,400,'2011-03-06','e',NULL),
      (6,401,'2011-03-06','e',NULL),
      (11,402,'2011-03-06','e',NULL),
      (2,403,'2011-03-06','e',NULL),
      (4,404,'2011-03-06','e',NULL),
      (3,405,'2011-03-06','e',NULL),
      (12,406,'2011-03-07','e',NULL),
      (5,407,'2011-03-07','e',NULL),
      (7,408,'2011-03-07','e',NULL),
      (10,409,'2011-03-07','e',NULL),
      (8,410,'2011-03-07','e',NULL),
      (1,411,'2011-03-07','e',NULL),
      (23,412,'2011-03-05','a',NULL),
      (13,413,'2011-03-05','a',NULL),
      (14,414,'2011-03-05','a',NULL),
      (17,415,'2011-03-05','a',NULL),
      (19,416,'2011-03-05','a',NULL),
      (20,417,'2011-03-05','a',NULL),
      (16,418,'2011-03-05','a',NULL),
      (15,419,'2011-03-05','a',NULL),
      (18,420,'2011-03-05','a',NULL),
      (21,421,'2011-03-05','a',NULL),
      (22,422,'2011-03-05','a',NULL);

INSERT INTO ama_protagonistas 
VALUES(300,'Milton','Rodrigues','m','1980-04-19',82746351,1,'Da Silva'),
      (301,'Viviane','Araujo','f','1975-03-25',93685724,5,NULL),
      (302,'Bruno','Bruna','f','1980-07-23',54218936,9,NULL),
      (303,'Sabrina','Sato','f','1981-02-04',73824695,4,NULL),
      (304,'Alexandre','Louzada','m','1957-12-15',61938475,1,'Oliveira'),
      (305,'Paulo','Barros','m','1962-05-14',42791583,2,NULL),
      (306,'Mauro','Quintaes','m','1958-08-12',98537162,3,NULL),
      (307,'Rosa','Magalhaes','f','1947-01-08',61354987,4,NULL),
      (308,'Renato','Lage','m','1949-05-21',75931648,5,'Souza'),
      (309,'Max ','Lopes','m','1949-05-15',28419673,6,NULL),
      (310,'Cid','Carvalho','m','1967-03-19',94673128,7,NULL),
      (311,'Paulo','Menezes','m','1971-09-19',58346729,8,NULL),
      (312,'Fabio ','Ricardo','m','1975-09-01',72189436,9,NULL),
      (313,'Cahe ','Rodrigues','m','1976-06-30',36549821,10,NULL),
      (314,'Roberto','Szaniecki','m','1961-10-30',47891632,11,NULL),
      (315,'Alex','De Souza','m','1965-09-30',63921857,12,'Rodriguez'),
      (316,'Jack ','Vasconcelos','m','1977-05-13',89214357,14,NULL),
      (317,'Marcus','Ferreira','m','1984-07-28',51693872,15,NULL),
      (318,'Jaime ','Cezario','m','1963-10-25',73682915,16,NULL),
      (319,'Carlinhos ','Muvucs','m','1983-09-28',28496137,17,NULL),
      (320,'Alexandre','Colla','m','1958-07-17',93742861,18,NULL),
      (321,'Severo','Luzardo','m','1962-06-29',65831429,19,NULL),
      (322,'Cristiano ','Bara','m','1973-02-11',49217658,20,'Costa'),
      (323,'Luiz','Bruno','m','1969-03-19',83724619,21,NULL),
      (324,'Amauri','Santos','m','1951-05-15',56198437,22,NULL),
      (325,'Lane','Santana','m','1974-11-15',29478631,23,NULL),
      (326,'Eduardo','Goncalves','m','1969-01-22',87463592,24,NULL),
      (327,'Fabio ','Santos','m','1982-04-19',51983764,25,NULL),
      (328,'Morgana ','Bastos','m','1976-03-25',28795416,26,NULL),
      (329,'Adilson','Pinto','m','1981-07-23',64821973,28,NULL),
      (330,'Augusto ','de Oliveira','m','1982-02-04',92436857,30,NULL),
      (331,'Luiz ','Cavalcante','m','1959-12-15',48531796,31,NULL),
      (332,'Alexandre ','Rangel','m','1964-05-14',63987142,32,'Santos'),
      (333,'Fabianno','Santana','m','1959-08-12',29381467,33,NULL),
      (334,'Robson','Goulart','m','1949-01-08',74832619,34,NULL),
      (335,'Eduardo','Minucci','m','1951-05-21',51628473,35,NULL),
      (336,'Claudinho','de Souza','m','1972-05-04',82735914,1,NULL),
      (337,'Selminha','Sorriso','f','1971-05-30',36479125,1,NULL),
      (338,'Fabio ','Junior','f','1973-09-19',54891673,13,NULL),
      (339,'Jessica','Ferreira','m','1961-12-03',81475329,13,NULL),
      (340,'Ze','Roberto','f','1970-04-26',71549283,24,NULL),
      (341,'Livia','Ferreira','m','1985-08-07',36825794,24,NULL);

INSERT INTO ama_carnavales_anuales
VALUES(2011,'2011-03-04','2011-03-12',300,301),
      (2012,'2012-02-17','2012-02-25',300,302),
      (2013,'2013-02-08','2013-02-16',300,303);

INSERT INTO ama_eventos 
VALUES(2011,190,'g','2011-03-05','22:00','18','s','Se caracteriza por su energía, ritmo y espiritualidad. Los bailarines utilizan movimientos fluidos y expresivos que reflejan una conexión profunda con la música y los ritmos africanos, como la samba, el candomblé y la capoeira. A través de la danza, se busca establecer una comunicación con lo divino y los espíritus, canalizando su poder y energía para el beneficio personal y colectivo.',2410.82,100),
      (2011,191,'d','2011-03-05','21:00','10','s','Los coreógrafos y diseñadores de cada una de las 12 escuelas preparan la escena del espectáculo en busca del codiciado título de campeones, que tanta fama y fortuna aporta a la escuela campeona.',630.59,101),
      (2012,192,'g','2012-02-21','23:00','18','s','En la noche del Gay Ball, la alfombra roja fuera del Scala Nightclub se reemplaza por una rosa, ya que este evento notoriamente fabuloso atrae a grandes multitudes de drag queens y sus admiradores. Los escandalosos atuendos de la notoria “alfombra rosa” del Gay Scala Ball atraen a los medios ya las celebridades. Drag kings y queens compiten por la atención mientras hacen sus grandes entradas en el Scala Nightclub.',1000,102),
      (2012,193,'g','2012-02-18','09:00','10','s','El baile contará con distinguidos sambistas del famoso bloco Bola Preta tocando las canciones bohemias que los convierten en algunos de los artistas más reconocidos de Brasil. Se espera que grandes nombres como João Roberto Kelly, Luiz Camillo y Dominguinhos se presenten en el inolvidable Cordão do Bola Preta Ball.',1200,103),
      (2013,194,'g','2013-02-17','23:00','18','s','Una fiesta dedicada a la banda callejera más grande y popular de Rio Canrnival. Teniendo lugar la noche anterior al desfile de la calle Cordão do Bola Preta, el baile contará con distinguidos sambistas del famoso bloco Bola Preta tocando las canciones bohemias que los convierten en algunos de los artistas más reconocidos de Brasil.',400,104),
      (2013,195,'d','2013-02-09','21:00','10','s','lleva a cabo algunas de las actuaciones más fascinantes del Desfile de Samba si bien a la sombra de las escuelas del Grupo Especial. la mejor escuela formará parte del Grupo Especial el año siguiente.',630.59,105),
      (2012,196,'g','2012-02-20','10:30','18','s','Es una noche dedicada a una de las bebidas favoritas de los cariocas: la Cerveja (cerveza). En este el ¡Viva la Cerveza! Ball disfrutarás de un suministro ilimitado de cerveza gratis y de fondo escucharás el ritmo palpitante de la mejor música del Carnaval de Río.',500,106),
      (2012,197,'d','2012-02-19','22:00','10','s','Es una mezcla única de arte, cultura, música y celebración.',160,107),
      (2013,198,'d','2013-02-09','21:00','10','s','En este desfile, las escuelas de samba campeonas de cada ciudad tienen la oportunidad de mostrar nuevamente sus elaboradas y espectaculares presentaciones. Cada escuela de samba presenta su tema central a través de carrozas, trajes elaborados, música y danzas.',385.73,108),
      (2012,199,'d','2012-02-20','21:00','10','s','Los coreógrafos y diseñadores de cada una de las 12 escuelas preparan la escena del espectáculo en busca del codiciado título de campeones, que tanta fama y fortuna aporta a la escuela campeona.',325.65,101),
      (2011,200,'d','2011-03-05','21:00','10','s','lleva a cabo algunas de las actuaciones más fascinantes del Desfile de Samba si bien a la sombra de las escuelas del Grupo Especial. la mejor escuela formará parte del Grupo Especial el año siguiente.',345.69,105),
      (2013,201,'d','2013-02-09','21:00','10','s','las seis escuelas principales regresan para la contienda final en el Desfile de Campeones el sábado posterior.',206.4,108);

INSERT INTO ama_participaciones 
VALUES(1,411,190,'2:50:00',12,1,'La Simplicidad de Un Rey,  El desfile de 2011 homenajeó al cantante y compositor Roberto Carlos, retratando la vida y la obra del artista.','A Simplicidade de Um ReiTínhamos na final dois sambas que dividiram a preferência dos segmentos. Como sempre, toda a comunidade foi ouvida. A decisão foi por critérios técnicos e estou confiante que a Beija-Flor continuará recebendo notas máximas dos julgadores de samba-enredo, como vem acontecendo nos últimos quinze anos. Espero que o Roberto (Carlos) goste do samba e de tudo o que está sendo feito para ele.'),
      (2,403,190,'0:30:00',4,2,'Unidos Da tijuca, actual campeona del grupo especial del carnaval de Río de Janeiro, homenajeará en la edición 2011 del carnaval más importante del mundo al cineasta y actor de cine de terror conocido como Zé do Caixão. Los desfiles y las alegorías del desfile 2011 de Unidos da Tijuca estarán inspiradas en las películas y en el particular mundo de este ícono del terror brasileño.','Esta Noite Levarei Sua AlmaTá com medo de quê?O filme já vai começarVocê foi convidadoCaronte no barco não pode esperarApague a luz, a guerra começouSob o capuz, delira o diretorNo filme que passa piada em cartazPavor me abraça, isso não se fazNo espaço se vai, é a força que vemMeu medo não teme ninguémÉ o boom! Quem não viu? A casa caiuCom a bomba na mão o vilão explodiuO plano de fuga é jogo de cenaUm Deus nos acuda... Agita o cinemaEle volta revolta, mistério no arDos milharais uma estranha visãoMais uma vez olha a encenaçãoMorrer de amar faz o povo gargalharPare! Eu pego vocês, grita o mal condutorMas deu tudo errado, não há outro lado Esse povo me enganouEu sou brasileiro, amor tijucanoRoteiro sem ponto final Coitado o barqueiro entrou pelo cano E brinca no meu carnaval Eu sou Tijuca, estou em cartaz Sucesso na tela meu povo é quem fazSou do Borel da gente guerreira A pura cadência levanta poeira'),
      (3,405,190,'2:50:00',6,3,'""El hijo fiel, siempre Mangueira"", dedicado a Nelson Cavaquinho, uno de los insignes compositores de esa popular escuela.','O Filho Fiel, Sempre Mangueira Mangueira é nação, é comunidade! Minha festa, teu samba, ninguém vai calar! Sou teu filho fiel, Estação Primeira Por tua bandeira, vou sempre lutar! Quis o Criador me abençoar Fazer de mim um menestrel Traço o meu passo no compasso Do surdo de primeira Sou Mangueira! Trilhei ruas e vielas Morro de alegria, de emoção! Procurando harmonia, encontrei a poesia E me entreguei à boemia No Buraco Quente, Olaria e Chalé Com meus parceiros de fé Trago violão No Zicartola, opinião! Se te encantei com meu talento Acabo te vendendo uma canção Passei aquela dor venceu espinhos Amor perfeito em nosso ninho Que foi desfeito ao luar! Prazer, me chamam Nelson Cavaquinho Tatuei em meu caminho Seletas obras musicais! Sonhei, que Folhas Secas cobriam meu chão Pra delírio dessa multidão Impossível não emocionar! Chorei, ao voltar para minha raiz Ao teu lado eu sou mais feliz Pra sempre vou te amar!'),
      (4,404,190,'1:40:00',5,4,'con ""Mitos e historias entrelazadas por los cabellos"", sobre la importancia de las cabelleras en las distintas culturas y que cuenta con la participación de la modelo Gisele Bundchen.','Mitos e Histórias Entrelaçadas pelos Fios de Cabelo Respeite a coroa em meu pavilhão A desfilar na avenida Carrega os fios de Isabel, da liberdade É minha vida, é a Vila! O brilho, a raiz, a sedução O universo em sua formação Nas longas madeixas de Shiva Dos ritos aos astros Os mitos que enlaçam Antigas tradições Festejando novas gerações Sansão, forte, se apaixonou O corte enfim revelou Dalila Trança a paixão, o nobre fiel Às lágrimas viu Rapunzel mais linda A força e o amor cobriram o corpo Vencendo as rédeas da exploração Perucas no Egito, poder divinal No luxo da França, adornam o Rei Sol Aqui, entrelaçado em ouro Vi florir a alforria, sonhos colorir Em tantas formas buscar perfeição Para os poetas a inspiração, afinal Charme e tom sensual Moldaram a beleza do meu carnaval Modéstia à parte, amigo, sou da Vila Quem é bamba nem sequer vacila Envolvido entre cabelos, me sinto arrepiar Feitiço refletindo no olhar'),
      (5,407,190,'22:10:00',8,5,'Académicos de Salgueiro, con su desfile ""Río en el cine"", dedicó al filme de animación una carroza titulada ""Volando sobre Río"" en la que la enorme ave azul batía sus alas y observaba con su profunda mirada al público que presenciaba el espectáculo.','Salgueiro Apresenta: O Rio no Cinema Salgueiro Apresenta o Rio no Cinema Já não há mais lugar para nos ver na passarela Cada um é um astro que entra em cena No maior espetáculo da tela A Cinelândia reencontrar A luz de apaga acende a vida Projeta sonhos na Avenida A Terra em Transe mostrou visão singular E o tesouro de Atlândita Foi abraçado pelo mar Onde está? Diz aí Carlota Joaquinha veio descobrir Na busca o bonde da Lapa Madame Satã Pequena Notável requebra até de manhã Em um simples instante Orfeu vence as dores em som dissonante E as cordas do seu violão Silenciam para o amanhecer Brilha o sol de um dia de verão Salta aos olhos outra dimensão Revoada risco o céu e faz Amigos alados canto de paz Maneiro deu a louca em Copacabana Vi beijo do homem na Mulher Aranha E o King Kong no relógio da Central Meu Salgueiro, o Oscar sempre é da Academia Põe o Bip-Bop na Furiosa Bateria Aqui tudo acaba em carnaval O cenário é perfeito De braços abertos sobre a Guanabara O filme mostrou maravilhosa chanchada Sob a direção do Redentor'),
      (6,401,190,'22:10:00',2,6,'una de las más prestigiosas, que apuesta por el tema ""Bailar samba hace bien a la salud"" y usa como hilo conductor la historia de la medicina desde la época del antiguo Egipto.','Imperatriz Adverte: Sambar Faz Bem à Saúde! Um ritual de magia Oh, Mãe África Do teu ventre nascia o poder de curar Despertam as antigas civilizações A cura pela fé nas orações Mistérios da vida, o homem a desvendar A mão da ciência ensina O mundo não pode parar Uma viagem no tempo a me levar O valor do pensamento a me guiar O toque do artista no Renascimento Surge um novo jeito de pensar! Luz, semeando a ciência A razão na essência, o dever de cuidar! Luz, a medida que avança Uma nova esperança que nos leva a sonhar! Segredo, a Chave da Vida Perfeição esculpida, iludindo o olhar Onde a medicina vai chegar? No Carnaval, uma injeção de alegria Dividida em doses de amor É a minha Escola a me chamar, doutor Posso ouvir o som da bateria O remédio pra curar a minha dor Eu quero é sambar A cura do corpo e da alma no samba está Sou Imperatriz, sou raiz e não posso negar Se alguém me decifrar É verde e branco meu DNA'),
      (7,408,190,'23:20:00',9,7,'Parábola dos Divinos Semeadores Tá todo mundo aí? Levanta a mão Quem é filho desse chão Chegou a Mocidade fazendo a alegria do povo Meu coração vai disparar de novo Uma luz no céu brilhou, liberdade! Meu coração venceu o medo O que era gelo se tornou felicidade A esperança se espalhando pelo chão A natureza tem mistérios e magias Rituais, feitiçarias, deuses a me abençoar Levado pela luz da estrela guia Eu vou por onde a semente germinar O que eu plantei, o mundo colheu Um milagre aconteceu A vida celebrou um ideal E a fartura se transforma em festival O que eu plantei, o mundo colheu Um milagre aconteceu A vida celebrou um ideal E a fartura se transforma em festival Festa de Ísis, a farra do vinho Em Roma a semente foi brotar Mudaram meu papel, oh Padre Miguel! Hoje ninguém vai me censurar No baile da máscara negra Até a nobreza teve que engolir Meu Brasil, de norte a sul sou manifestação Aonde vou arrasto a multidão De cada cem só não vem um Vou voltar, um dia ao espaço sideral E reviver o meu ziriguidum, em alto astral','Parábola dos Divinos Semeadores Tá todo mundo aí? Levanta a mão Quem é filho desse chão Chegou a Mocidade fazendo a alegria do povo Meu coração vai disparar de novo Uma luz no céu brilhou, liberdade! Meu coração venceu o medo O que era gelo se tornou felicidade A esperança se espalhando pelo chão A natureza tem mistérios e magias Rituais, feitiçarias, deuses a me abençoar Levado pela luz da estrela guia Eu vou por onde a semente germinar O que eu plantei, o mundo colheu Um milagre aconteceu A vida celebrou um ideal E a fartura se transforma em festival O que eu plantei, o mundo colheu Um milagre aconteceu A vida celebrou um ideal E a fartura se transforma em festival Festa de Ísis, a farra do vinho Em Roma a semente foi brotar Mudaram meu papel, oh Padre Miguel! Hoje ninguém vai me censurar No baile da máscara negra Até a nobreza teve que engolir Meu Brasil, de norte a sul sou manifestação Aonde vou arrasto a multidão De cada cem só não vem um Vou voltar, um dia ao espaço sideral E reviver o meu ziriguidum, em alto astral'),
      (8,410,190,'1:40:00',11,8,'presentó un homenaje a la actriz y directora brasileña Maria Clara Machado, con el tema ‘El sueño siempre viene para quien sueña‘, creado por el carnavalesco Paulo Menezes.','O Sonho Sempre Vem pra quem Sonhar... Tudo pode ser Se quiser será Sonhos sempre vêm Pra quem sonhar Tudo pode ser Só basta acreditar Tudo que tiver que ser, será Tudo que eu fizer Eu vou tentar melhor do que já fiz Esteja o meu destino onde estiver Eu vou buscar a sorte e ser feliz Tudo que eu quiser O cara lá de cima vai me dar Me dar toda coragem que puder Que não me falte forças pra lutar Vamos com você Nós somos invencíveis, pode crer Todos somos um E juntos não existe mal nenhum Vamos com você Nós somos invencíveis, pode crer O sonho está no ar O amor me faz cantar Lua de cristal Que me faz sonhar Faz de mim estrela Que eu já sei brilhar Lua de cristal Nova de paixão Faz a minha vida Cheia de emoção Lua de cristal Que me faz sonhar Faz de mim estrela Que eu já sei brilhar'),
      (9,400,190,'21:00:00',1,9,'Sao Clemente que para este año escogió una temática con la que pretende rendir homenaje a la ciudad bajo el eslogan ""Río, bendecido por Dios y bonito por naturaleza"".','O Seu, o Meu, o Nosso Rio, Abençoado por Deus e Bonito por Natureza! ""O meu paraíso tem vista pro mar De Braços abertos vou abençoar O Pão de Açúcar, inspiração Estampado no meu pavilhão"" Sou carioca e São Clemente Irreverente, minha paixão Meu Rio sua beleza inspira o mar azul Canta Zona Sul! (2x) E Deus fez a maravilha Mistérios brotam deste chão Que a natureza esculpiu Divina emoção O Rio nasceu no sol da canção Terra cobiçada, iluminada Gente feliz Menina dos olhos Do Pai Criador Que o padroeiro abençoou Nas suas águas me banhar Da fonte vou beber E nesse império tropical Amanhecer (2x) Passo a passo... Civilização O modernismo surgiu Entre riscos e traços se rebatizou Cidade maravilhosa! ""Minha alma canta"", de tanta emoção A bossa embala, o ""tom"" da canção Preservar! É o caminho vamos respeitar Ser carioca é saber cuidar Do patrimônio mundial Rio, seu pôr-do-sol é um poema Braços abertos entra em cena Nesse carnaval! Sou carioca e São Clemente Irreverente, minha paixão Meu Rio sua beleza inspira o mar azul Canta Zona Sul! (2x)'),
      (10,409,190,'0:30:00',10,10,'presentó un cuento sobre una isla encantada que representa a Florianópolis, capital del estado de Santa Catarina, en el sur del país','Y-Jurerê Mirim - A Encantadora Ilha das Bruxas (Um conto de Cascaes) Y-Jurerê mirim Meu paraíso, que maravilha! Foi Deus quem fez assim Com todo encanto, essa magia Entre contos e lendas Quanta imaginação Celebrando a natureza Rituais de gratidão Eu também sou carijó É bendito o meu lugar Rezei forte nesse chão Sai pra lá assombração Já peguei meu patuá Caldeirão vai ferver A Grande Rio chegou Vem trazer pra você Uma porção de amor É a receita que a bruxinha ensinou O folclore é tradição Valorizando a cultura popular O canto, a dança O sagrado e o profano Minha ilha encantada Vivo te admirando Beleza, riqueza Repousando sobre o mar Santuário pra sonhar Meu Rio te abraça, Floripa tão bela A tua história virou carnaval Essa ponte é a luz na passarela É obra-prima esse cartão postal'),
      (11,402,190,'23:20:00',3,11,'""Río, azul del color del mar"", sobre la navegación marítima,','Rio, Azul da Cor do Mar Brilhou no céu A luz da águia, a estrela-guia Do coração navegador Que na travessia enfrentou Todo o medo que havia Era só mitologia do mar A lenda deu lugar para a certeza Que pra viver é preciso navegar As galés do oriente já vêm Da Fenícia e do Egito também Gregos e romanos partem para conquistar E o Farol da Alexandria fez a noite clarear Os mistérios vão desvendar Um novo caminho encontrar Lá na Índia, especiarias Leva-e-traz mercadorias A ambição do europeu se encantou Com o novo mundo de riqueza natural, sem igual Os navios negreiros Deixam seus lamentos pelo ar Nas águas de Iemanjá Nem pirata aventureiro ou rei podem mandar Oi leval mar, oi leva Leva as jangadas numa nova direção O porto centenário abriu seus braços Na terra de São Sebastião Portela vai buscar no horizonte A eterna fonte de inspiração Um oceano de amor que virou arte E deságua na imaginação Lindo como o mar azul Meu grande amor, minha Portela A força do seu pavilhão vai me levar A navegar'),
      (12,406,190,'21:00:00',7,12,'enredo (tema central) trató sobre la teoría de la evolución, inició su espectáculo con un actor representando al científico inglés Charles Darwin (1809-1882), de gruesas patillas y traje de época azul, según reportó la agencia italiana Ansa.','O Mistério da Vida Minha alegria vai girar o mundo Aventureira vai cruzando o mar Trazendo Darwin na memória Histórias vou desvendar Um relicário de beleza natural É o esplendor do carnaval Que maravilha, nessa terra vou desembarcar O show da Ilha vai começar No fundo do mar eu vi brotar Se multiplicar a vida Mistérios vão se revelar Nas águas que vão me levar... a caminhar A terra abriu um sorriso E o paraíso vai me ver chegar Seres estão antenados Pequenos alados bailando no ar Lindos animais na passarela E lá no céu, a mais linda aquarela Do alto surgiu diferente Não sei se é bicho, não sei se é gente? Somos frutos do mesmo lugar A árvore da vida vamos preservar Hoje eu quero brindar... a Ilha Nessa avenida dos sonhos brilhar O meu amanhã, só Deus saberá A vida vamos celebrar');

INSERT INTO ama_roles
VALUES(300,1,411,190,'rey momo'),
      (301,5,407,190,'reina del carnaval'),
      (310,7,408,190,'carnavalesco'),
      (311,8,410,190,'carnavalesco'),
      (312,9,400,190,'carnavalesco'),
      (327,6,401,195,'carnavalesco'),
      (328,22,422,195,'carnavalesco'),
      (336,1,411,190,'mestre-sala'),
      (337,1,411,190,'porta-bandeira');

INSERT INTO ama_detalles_reservas
VALUES(180,161,2),
      (181,162,2),
      (182,163,1),
      (183,164,3),
      (184,165,4),
      (185,166,5),
      (186,167,7),
      (187,168,3),
      (188,169,2);

INSERT INTO ama_entradas
VALUES(2011,191,210,'12:00','2011-02-12',180),
      (2011,200,211,'5:00','2011-01-11',181),
      (2011,191,212,'8:00','2010-12-06',182),
      (2012,191,213,'9:00','2011-05-15',183),
      (2012,200,214,'15:00','2011-09-16',184),
      (2012,198,215,'16:00','2012-02-01',185),
      (2013,199,216,'10:00','2012-10-05',186),
      (2013,200,217,'14:00','2013-01-06',187),
      (2013,201,218,'13:00','2012-12-18',188);

INSERT INTO ama_historicos_precios 
VALUES(161,171,2011,191,210,'2010-05-01',1990,'2011-04-27'),
      (162,172,2011,200,211,'2010-05-01',312,'2011-04-27'),
      (163,173,2011,191,212,'2010-05-01',131,'2011-04-27'),
      (164,174,2012,191,213,'2011-06-01',2105,'2012-02-10'),
      (165,175,2012,200,214,'2011-06-01',2150,'2012-02-10'),
      (166,176,2012,198,215,'2011-06-01',99,'2012-02-10'),
      (167,177,2013,199,216,'2012-05-01',266,'2013-02-01'),
      (168,178,2013,200,217,'2012-05-01',1990,'2013-02-01'),
      (169,179,2013,201,218,'2012-05-01',1690,'2013-02-01');

COMMIT;