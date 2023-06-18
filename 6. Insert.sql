-- I N S E R C C I O N  D E  D A T O S

INSERT INTO ama_clientes 
VALUES(DEFAULT,'Juan','Perez','Garcia','n','1990-01-10',345346456,'juan.perez@gmail.com'),
      (DEFAULT,'Maria','Lopez','Sandoval','e','1985-07-22',987654321,'maria.lopez@hotmail.com'),
      (DEFAULT,'Pedro','Rodriguez','Fernandez','n','1992-03-15',456789012,'pedro.fernandez@outlook.com'),
      (DEFAULT,'Laura','Ramirez','Santos','n','1988-11-05',321098765,'laura.ramirez@gmail.com'),
      (DEFAULT,'Carlos','Gonzalez','Perez','e','1996-09-18',210987654,'carlos.gonzalez@apple.com'),
      (DEFAULT,'Gabriela','Ortiz','Gomez','n','1989-04-03',876543210,'gabriela.ortiz@hotmail.com'),
      (DEFAULT,'Ricardo','Morales','Hernandez','n','1997-12-16',234567890,'ricardo.morales@outlook.com'),
      (DEFAULT,'Luis','Mendez','Reyes','n','1993-08-07',543210987,'luis.mendez@apple.com'),
      (DEFAULT,'Alejandro','Vargas','Mendoza','n','1991-02-28',789012345,'alejandro.vargas@gmail.com'),
      (DEFAULT,'Manuel','Flores','Lopez','e','1998-12-10',890123456,'manuel.flores@apple.com'),
      (DEFAULT,'Carolina','Ramos','Morales','n','1996-07-29',456789012,'carolina.ramos@outlook.com');

INSERT INTO ama_lugares_evento 
VALUES(2320,'Baile Magico','Avenida Atlântica 1702, Hotel Copacabana Palace'),
      (3412,'Desfile del Bloque Noivas Do Parú','Praia de Itaguaçu'),
      (2412,'Baile Gay del Scala','Scala nigth Club. Avenida Treze de Maio 23, Centro'),
      (3451,'The City Ball','Rua 13 de Maio, 23, Centro de Río de Janeiro.'),
      (2390,'Bola Preta Ball','Scala nigth Club. Avenida Treze de Maio 23, Centro'),
      (3419,'Meu e Seu','Harmonia Do Samba'),
      (2381,'Beer Ball','Scala Rio Nightclub: Avenida Treze de Maio 23, Centro'),
      (2347,'Special Group 1','Sambódromo Profesor Darcy Ribeiro'),
      (4523,'Champion’s Parade','Sambódromo Profesor Darcy Ribeiro');

INSERT INTO ama_regiones_rio 
VALUES(1,'Region metropolitana','Abarca 20 municipios.'),
      (2,'Zona Norte','Ubicada en el Norte del Macizo de Tijuca, al sur de la Baxiada Fluminende y al oeste de la Bahia de Guanabara'),
      (3,'Zona Oeste','Cubre 12 barrios'),
      (4,'Region Sudeste','es la segunda region mas pequeña del pais'),
      (5,'Zona Central','Esta dividido por la Avenida Presidente Vargas, la principal avenida de la Region Central'),
      (6,'Zona Sur','Cubre 12 barrios, tiene 639.522 poblacion'),
      (7,'Region Noredeste','Contiene 9 estados');

INSERT INTO ama_empresas 
VALUES(458,'Bookers International','info@bookersinternational.com'),
      (719,'Rio Maximo','info@riomaximo.com'),
      (603,'Rio ticket','Info@rio-Tickets.com'),
      (895,'Carnavales Brasil','info@carnavales-brasil.com'),
      (276,'Rio Carnaval Tickets','riocarnavaltickets@gmail.com'),
      (531,'Trip advisor','northamericapr@tripadvisor.com'),
      (684,'Ticket Rio','riocarnavaltickets@gmail.com'),
      (192,'Rio','info@riocarnaval.com'),
      (347,'Viator','viatortravel'),
      (347,'Viator','viatortravel');

INSERT INTO ama_autorizaciones 
VALUES(458,5000),
      (719,2500),
      (603,2000),
      (895,3000),
      (276,5000),
      (531,1000),
      (684,1500),
      (192,2000),
      (347,5000);    

INSERT INTO ama_tipos_entradas 
VALUES(1,DEFAULT,gp,3,8,e,'a'),
      (2,DEFAULT,gf,5,7,c,'b'),
      (3,DEFAULT,an,2,4,a,'c'),
      (4,DEFAULT,sl,9,11,e,'a-b'),
      (5,DEFAULT,gf,1,6,c,'c-d'),
      (6,DEFAULT,an,4,9,a,'b'),
      (7,DEFAULT,gp,7,3,c,'a'),
      (8,DEFAULT,sl,10,5,e,'a-b'),
      (9,DEFAULT,an,6,2,a,'c');

INSERT INTO ama_reservas 
VALUES(967,'2011-01-15',DEFAULT,1000.25,'2011-02-05'),
      (128,'2012-06-30',DEFAULT,2500.75,'2012-07-15'),
      (359,'2013-04-12',DEFAULT,1200.60,'2013-05-05'),
      (746,'2012-09-02',DEFAULT,800.35,'2012-09-20'),
      (682,'2011-08-25',DEFAULT,600.90,'2011-09-10'),
      (513,'2012-11-09',DEFAULT,1500.20,'2012-11-30'),
      (735,'2013-07-17',DEFAULT,300.75,'2013-08-05'),
      (888,'2011-03-22',DEFAULT,700.45,'2011-04-10'),
      (943,'2013-10-14',DEFAULT,1800.30,'2013-10-30');

INSERT INTO ama_escuelas_samba 
VALUES(1,'Beija-Flor','25-12-1948','Centro de Nilopolis','azul y blanco','es una escuela de samba brasileña del municipio deNilópolis, pero que lleva muchos años participando en el Carnaval de la ciudad de Río de Janeiro. Con catorce logros, la escuela asume la tercera mayor ganadora en el rol de los campeones del carnaval de Río de Janeiro, siendo la que más ganó en la "era sambódromo".',1),
      (2,'Unidos da Tijuca','31-12-1931','Tijuca','amarillo y azul','es una escuela de samba en la ciudad de Río de Janeiro, Tiene 4 títulos de campeón del Grupo Especial del carnaval carioca',2),
      (3,'Primera Estacion de Manguera','28-04-1928','Mangueira','verde y rosa','es una escuela de samba tradicional brasileña de la ciudad de Río de Janeiro, ocupa la posición de segundo mayor ganador en la lista de campeones del carnaval de Río de Janeiro',2),
      (4,'Unidos de Vila Isabel','04-04-1946','Vila Isabel','banco y azul','es una de las escuelas de samba más tradicionales de la ciudad de Río de Janeiro, fue campeona del Grupo Especial Carnaval en 1988, 2006 y 2013.',2),
      (5,'Academicos del Salgueiro','05-03-1953','Pandeiro','rojo y blanco','es una de las escuelas de samba más tradicionales de la ciudad de Río de Janeiro. Tiene nueve títulos de campeón del Grupo Especial del Carnaval de Río. la posición de cuarto mayor ganador en la lista de campeones del carnaval de Río de Janeiro.',2),
      (6,'Emperatriz Leopoldinense','06-03-1959','Ramos','verde, blanco, dorado','es una escuela de samba de la ciudad de Rio de Janeiro, Imperatriz Leopoldinense es poseedora de nueve títulos de campeona del grupo principal del carnaval carioca, siendo que en 1980, 1989 y 2001 fue campeona obteniendo la máxima puntuación en todos los aspectos',2),
      (7,'Juventud Independiente de Padre Miguel','10-11-1955','Padre Miguel','verde, blanco, amarillo','es una escuela de samba en la ciudad de Río de Janeiro. Dueña de seis logros (1979, 1985, 1990, 1991, 1996, 2017), la escuela se ubica como la séptima mayor ganadora del Carnaval de Campeones del Carnaval de Río de Janeiro.',3),
      (8,'Unidos del Puerto de la Piedra','08-03-1978','Porto da Piedra','rojo, blanco','La asociación fue creada a partir de un equipo de fútbol. En Río, nunca ganó el título de campeona del grupo principal. Ya en São Gonçalo, fue campeona una vez, en el año 1982',4),
      (9,'San Clemente','25-01-1961','Cidade Nova','negro, amarillo','es una escuela de samba brasileña de la ciudad de Río de Janeiro,u mejor colocación en el Grupo Especial del Carnaval fue el 6o lugar en 1990 con la trama "E o Samba Sambou" que criticaba la mercantilización del carnaval. En 2021, la escuela completa 23 participaciones entre las grandes escuelas del Grupo Especial, siendo que, por 11 veces consecutivas, entre 2011 y 2021.',5),
      (10,'Academicos del Gran Rio','22-09-1988','Centro de Duqe de Caxias','verde, blanco, rojo','es una escuela de samba brasileña del municipio de Duque de Caxias, que desfila en el carnaval de la ciudad de Río de Janeiro, más precisamente en el Grupo Especial. Fue campeona del Grupo Especial del Carnaval por primera vez en la historia en 2022. También fue subcampeona en 2006, 2007, 2010 y 2020. La exaltación a la región amazónica ha sido recurrente en sus desfiles, inspirando las tramas de 1995, 1997, 2006 y 2008.',1),
      (11,'Portela','11-04-1923','Madureira','azul, blanco','es una escuela de samba brasileña de la ciudad de Río de Janeiro. Portela es la mayor campeona del carnaval de Río de Janeiro, con 22 títulos',2),
      (12,'Union de la Isla del Gobernador','07-03-1953','Cacuia','azul, blanco, rojo','es una escuela de samba de la ciudad de Río de Janeiro, campeona del grupo de acceso en dos ocasiones',2),
      (13,'Renascer de Jacarepagua','02-08-1992','Tanque','rojo, blanco','es una escuela de samba en la ciudad de Río de Janeiro. campeón del grupo de acceso en el 2011',3),
      (14,'Unidos de Viradouro','24-06-1946','Barreto','rojo, blanco','es una escuela de samba brasileña, fue dos veces campeona del Grupo Especial',1),
      (15,'Estacio de Sa','27-02-1955','Estacio','rojo, blanco','es una escuela de samba brasileña de la ciudad de Río de Janeiro. Tiene el título de campeón del Grupo Especial de Río de Janeiro, conquistado en 1992, con el argumento "Paulicéia Desvairada - 70 años de Modernismo". También ganó siete veces la segunda división del carnaval carioca y dos veces la tercera división.',5),
      (16,'Academicos de Cubango','17-12-1959','Cubango','verde, blanco','es una escuela de samba brasileña de la ciudad de Niterói, que desde los años ochenta participa del carnaval de Río,',1),
      (17,'Academicos de Santa Cruz','18-02-1959','Santa Cruz','verde, blanco','es una escuela de samba brasileña de la ciudad de Río de Janeiro. Poseen 5 Títulos de Segunda División',3),
      (18,'Imperio Serrano','23-03-1947','Madureira','verde, blanco','es una escuela de samba brasileña de la Zona Norte, Império Serrano es el cuarto mayor ganador de la juerga carioca, con nueve títulos de campeonato, También tiene cinco títulos de segunda división, Desfile por primera vez en 1948, siendo cuatro veces campeón en la primera cuatro desfiles que participaron',2),
      (19,'Imperio de Tijuca','08-12-1940','Tijuca','verde, blanco','es una escuela de samba brasileña de la ciudad de Río de Janeiro. Su mejor colocación fue un cuarto lugar, logrado en su desfile debut, en 1946.',2),
      (20,'Inocentes de Belford Roxo','11-07-1993','Parque Sao Vicente','azul, blanco, rojo','es una escuela de samba brasileña de la ciudad de Belford Roxo, que participa en el Carnaval de Río de Janeiro. un campeonato en segunda, tercera y cuarta división',1),
      (21,'Academicos de Rocinha','30-03-1988','Sao Conrado','blanco, azul, verde','es una escuela de samba brasileña de la ciudad de Río de Janeiro. Un campeonato de segunda división, 4 campeonatos de tercera división, un campeonato de cuarta división y un',6),
      (22,'Caprichosos de Pilares','19-02-1949','Pilares','azul royale, azul turquesa, Blanco','es una escuela de samba brasileña de la ciudad de Río de Janeiro. Su mejor ubicación en el Grupo Especial de Carnaval fue el 3er lugar en el Desfile Dominical en 1984.',2),
      (23,'Alegria de la Zona Sur','28-06-1992','Copacabana','rojo, blanco, dorado','es una escuela de samba en la ciudad de Río de Janeiro. su característica más fuerte en sus tramas es el uso de temas que tratan el tema de la negrura, un campeonato en tercera, cuarta, quinta y dos en sexta división',6),
      (24,'Paraiso de Tuiuti','05-04-1952','Sao Cristovao','azul, amarillo','Es una escuela de samba con sede en la ciudad de Río de Janeiro, Campeonato En Segunda División, Tres En Tercera División, Dos En Cuarta División',5),
      (25,'Union del Parque Curicica','01-03-1993','Curicica','azul, rojo, blanco','es una escuela de samba de la ciudad de Río de Janeiro, campeonato de cuarta división',3),
      (26,'Unidos de Padre Miguel','12-11-1957','Padre Miguel','rojo, blanco','es una escuela de samba en la ciudad de Río de Janeiro. Tiene seis campeonatos ganados en grupos de acceso.',3),
      (27,'Arranco','21-03-1973','Engenho de Dentro','azul, blanco','es una escuela de samba de la ciudad de Río de Janeiro, una vez campeona del grupo B',2),
      (28,'Sereno de Campo Grande','12-02-1996','Campo Grande','azul, blanco','es una escuela de samba de la ciudad de Río de Janeiro, campeona del grupo E en una ocasión',3),
      (29,'Union de Jacarepagua','15-11-1956','Aperto de mao','verde, blanco','es una escuela de samba de la ciudad de Rio de Janeiro, Campeon de la serie D en dos ocasiones',2),
      (30,'Tradicion','01-10-1984','Campinho','azul royal, azul turquesa, blanco, dorado, gris','es una escuela de samba de la ciudad de Río de Janeiro, fue campeona de segunda división en tres ocasiones. Su mejor ubicación en el grupo especial fue el sexto lugar en 1994.',2),
      (31,'Dificil es el nombre','31-10-1973','Pilares','rojo, blanco','es una escuela de samba de la ciudad de Río de Janeiro, campeona del grupo B en una ocasión',3),
      (32,'Juventud de Vicente Carvalho','07-02-1988','Aguia','verde, blanco','es una escuela de samba en la ciudad de Río de Janeiro. Cuenta con dos títulos de campeonato y tres subcampeonatos conseguidos en grupos de acceso. En 2002 ganó el Grupo D; y en 2007 Grupo C. Desfiló varias veces en Grupo B, nunca habiendo llegado a Serie A y Grupo Especial.',2),
      (33,'Academicos de la tranquilidad','10-11-1969','Largo da Batalha','azul, blanco','es una escuela de samba de la ciudad de Niterói, fue cuatro veces campeona del Grupo Especial del Carnaval de Niterói. También tuvo otros dos títulos en el Niteroi Access Group. En el carnaval de Río de Janeiro, ganó cuatro campeonatos en grupos de acceso.',1),
      (34,'Independientes de San Juan de Meriti','26-03-1975','Praca da Bandeira','azul, verde, blanco','es una escuela de samba de São João de Meriti, Campeona del grupo C, D y E',1),
      (35,'Lins Imperial','07-03-2023','Aguia','verde, rosa','es una escuela de samba brasileña de la ciudad de Río de Janeiro, un campeonato en segunda división y 4 campeonatos en tercera división',2),
      (36,'Infantes de Lins','01-05-1991','Lins de Vasconcelos','verde, rosa','es una escuela de samba infantil de la ciudad de Río de Janeiro. Campeon en el carnaval 2011 de la seccion infantil en la reedicion de la trama de samba Lins Imperial de 1991.',2),
      (37,'Nueva Generacion del Estacio de Sa','12-10-1992','Estacio','rojo, blanco','es una escuela de samba para niños de la ciudad de Río de Janeiro. Subampeon en el carnaval 2011 de la seccion infantil en la reedicion de la trama de 1992 de Estácio de Sá.',2),
      (38,'Inocentes de Caprichosos','04-04-1991','Pilares','azul royal, azul turquesa, blanco','es una escuela de samba para niños de la ciudad de Río de Janeiro. 3er lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 2004 de Caprichosos de Pilares.',2),
      (39,'Pimpolhos de la Gran Rio','10-08-2002','Centro','verde, blanco, rojo','es una escuela de samba infantil y una organización no gubernamental, ubicada en la Rua Conde de Porto Alegre, en el centro de Caxias. 4to lugar en el carnaval del 2011 de la seccion infantil en la trama de "...nuestros cuentos...".',1),
      (40,'Corazones Unidos del Ciep','15-08-1985','Mangueira','naranja, blanco, amarillo','es una escuela de samba para niños de la ciudad de Río de Janeiro.  5to lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1997 de Uniao da Ilha do Governador.',DEFAULT),
      (41,'Desfiles de Guanabara','06-06-1996','Copacabana','azul, amarillo','es una escuela de samba para niños de la ciudad de Río de Janeiro. 6to lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1998 de Académicos de Santa Cruz.',6),
      (42,'Herederos de la Villa','23-06-1988','Coroa','azul claro, blanco','es una escuela de samba junior de la ciudad de Río de Janeiro. 7mo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1994 de Unidos de Vila Isabel.',2),
      (43,'Aprendices del Sauce','03-10-1989','Andarai','blanco, rojo','es la escuela de samba junior de Academicos do Salgueiro. ubicada en la misma dirección del bloque Salgueiro, en la Zona Norte de la ciudad de Río de Janeiro. 8vo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1969 de Academicos do Salgueiro.',7),
      (44,'Estrellita de la Juventud','02-06-1992','Padre Miguel','verde, blanco','es una escuela de samba para niños de la ciudad de Río de Janeiro. 9no lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 2002 de Mocidade.',3),
      (45,'Petizes da Penha','26-06-2002','Penha','verde, blanco','es una escuela de samba junior de la ciudad de Río de Janeiro. 10mo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 2006 de Flor da Mina do Andaraí.',2),
      (46,'La niña de Cabucu','14-07-1991','Lins de Vasconcelos','azul, blanco','es la escuela de samba juvenil de Unidos do Cabucu, ubicada en la Zona Norte de la ciudad de Río de Janeiro. 11vo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1988 de Unidos do Cabucu.',2),
      (47,'Hijos del Aguila','31-07-2001','Madureira','azul, blanco','es una escuela de samba para niños de la ciudad de Río de Janeiro. 12vo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1984 de Portela.',2),
      (48,'Imperio del Futuro','05-08-1983','Madureira','verde, blanco','es una escuela de samba junior de la ciudad de Río de Janeiro. 13vo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1972 de Império Serrano.',2),
      (49,'Manguera del mañana','12-08-1987','Mangueria','verde, rosa','es una escuela de samba junior de la ciudad de Río de Janeiro. 14vo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 1994 de Mangueira.',2),
      (50,'Tijuquinha do Borel','19-06-2002','Tijuca','Amarillo, azul','es una escuela de samba junior de la ciudad de Río de Janeiro. 15vo lugar en el carnaval del 2011 de la seccion infantil en la reedicion de la trama de 2005 de Unidos da Tijuca.',2),
      (51,'Todavia hay niños en Vila Kennedy','21-04-1991','Vila Kennedy','rojo, blanco','es una escuela de samba para niños en la ciudad de Río de Janeiro. reeditó varias tramas de Portela en diferentes años de los carnavales. En 2015 realizó un desfile sobre el carnaval Juegos Olímpicos',3),
      (52,'Unidos de Vila Santa Tereza','20-12-1956','Rocha Miranda','azul, blanco, amarillo','es una destacada escuela de samba de Río de Janeiro, Brasil, fundada en 1960. Representa y celebra la cultura y tradiciones del barrio de Santa Tereza. Conocida por su pasión y energía, ha ganado reconocimiento en el carnaval carioca. Su batería y samba-enredo son emblemáticos. Realizan desfiles coloridos y coreografías elaboradas. Además del carnaval, se involucran en actividades comunitarias y promueven la inclusión social. Unidos de Vila Santa Tereza es un símbolo de identidad y una fuente de inspiración para su comunidad.',2),
      (53,'Miel del futuro','06-11-2003','Maria de Gracia','negro, amarillo','es una escuela de samba para niños de la ciudad de Río de Janeiro. Fue la tercera escuela en desfilar en 2012 con una reedición de Imperatriz, la samba de 1999.',2);

INSERT INTO ama_hist_grupos 
VALUES(

INSERT INTO ama_protagonistas 
VALUES(1,'Milton','Rodrigues','Da Silva','m','19-04-1980',82746351,DEFAULT),
      (2,'Viviane','Araujo','NULL','f','25-03-1975',93685724,DEFAULT),
      (3,'Bruno','Bruna','NULL','f','23-07-1980',54218936,DEFAULT),
      (4,'Sabrina','Sato','NULL','f','04-02-1981',73824695,DEFAULT),
      (5,'Alexandre','Louzada','Oliveira','m','15-12-1957',61938475,1),
      (6,'Paulo','Barros','NULL','m','14-05-1962',42791583,2),
      (7,'Mauro','Quintaes','NULL','m','12-08-1958',98537162,3),
      (8,'Rosa','Magalhaes','NULL','f','08-01-1947',61354987,4),
      (9,'Renato','Lage','Souza','m','21-05-1949',75931648,5),
      (10,'Max ','Lopes','NULL','m','15-05-1949',28419673,6),
      (11,'Cid','Carvalho','NULL','m','19-03-1967',94673128,7),
      (12,'Paulo','Menezes','NULL','m','19-09-1971',58346729,8),
      (13,'Fabio ','Ricardo','NULL','m','01-09-1975',72189436,9),
      (14,'Cahe ','Rodrigues','NULL','m','30-06-1976',36549821,10),
      (15,'Roberto','Szaniecki','NULL','m','30-10-1961',47891632,11),
      (16,'Alex','De Souza','Rodrigues','m','30-09-1965',63921857,12),
      (17,'Jack ','Vasconcelos','NULL','m','13-05-1977',89214357,14),
      (18,'Marcus','Ferreira','NULL','m','28-07-1984',51693872,15),
      (19,'Jaime ','Cezario','NULL','m','25-10-1963',73682915,16),
      (20,'Carlinhos ','Muvucs','NULL','m','28-09-1983',28496137,17),
      (21,'Alexandre','Colla','NULL','m','17-07-1958',93742861,18),
      (22,'Severo','Luzardo','NULL','m','29-06-1962',65831429,19),
      (23,'Cristiano ','Bara','Costa','m','11-02-1973',49217658,20),
      (24,'Luiz','Bruno','NULL','m','19-03-1969',83724619,21),
      (25,'Amauri','Santos','NULL','m','15-05-1951',56198437,22),
      (26,'Lane','Santana','NULL','m','15-11-1974',29478631,23),
      (27,'Eduardo','Goncalves','NULL','m','22-01-1969',87463592,24),
      (28,'Fabio ','Santos','NULL','m','19-04-1982',51983764,25),
      (29,'Morgana ','Bastos','NULL','m','25-03-1976',28795416,26),
      (30,'Adilson','Pinto','NULL','m','23-07-1981',64821973,28),
      (31,'Augusto ','de Oliveira','NULL','m','04-02-1982',92436857,30),
      (32,'Luiz ','Cavalcante','NULL','m','15-12-1959',48531796,31),
      (33,'Alexandre ','Rangel','Santos','m','14-05-1964',63987142,32),
      (34,'Fabianno','Santana','NULL','m','12-08-1959',29381467,33),
      (35,'Robson','Goulart','NULL','m','08-01-1949',74832619,34),
      (36,'Eduardo','Minucci','NULL','m','21-05-1951',51628473,35),
      (37,'Claudinho','de Souza','NULL','m','04-05-1972',82735914,1),
      (38,'Selminha','Sorriso','NULL','f','30-05-1971',36479125,1),
      (39,'Fabio ','Junior','NULL','f','19-09-1973',54891673,13),
      (40,'Jessica','Ferreira','NULL','m','03-12-1961',81475329,13),
      (41,'Ze','Roberto','NULL','f','26-04-1970',71549283,24),
      (42,'Livia','Ferreira','NULL','m','07-08-1985',36825794,24);

INSERT INTO ama_carnavales_anuales
VALUES('2011','04-03-2011','12-03-2011',DEFAULT),
      ('2012','17-02-2012','25-02-2012',DEFAULT),
      ('2013','08-02-2013','16-02-2013',DEFAULT);

INSERT INTO ama_eventos 
VALUES('2011',DEFAULT,'g','05-03','22:00','18','s','Se caracteriza por su energía, ritmo y espiritualidad. Los bailarines utilizan movimientos fluidos y expresivos que reflejan una conexión profunda con la música y los ritmos africanos, como la samba, el candomblé y la capoeira. A través de la danza, se busca establecer una comunicación con lo divino y los espíritus, canalizando su poder y energía para el beneficio personal y colectivo.',2410.82,2320),
      ('2011',DEFAULT,'g','06-03','15:00','16','s','NULL',50,3412),
      ('2012',DEFAULT,'g','21-02','23:00','18','s','En la noche del Gay Ball, la alfombra roja fuera del Scala Nightclub se reemplaza por una rosa, ya que este evento notoriamente fabuloso atrae a grandes multitudes de drag queens y sus admiradores. Los escandalosos atuendos de la notoria “alfombra rosa” del Gay Scala Ball atraen a los medios ya las celebridades. Drag kings y queens compiten por la atención mientras hacen sus grandes entradas en el Scala Nightclub.',1000,2412),
      ('2012',DEFAULT,'g','18-02','9:00','10','s','El baile contará con distinguidos sambistas del famoso bloco Bola Preta tocando las canciones bohemias que los convierten en algunos de los artistas más reconocidos de Brasil. Se espera que grandes nombres como João Roberto Kelly, Luiz Camillo y Dominguinhos se presenten en el inolvidable Cordão do Bola Preta Ball.',1200,3451),
      ('2013',DEFAULT,'g','17-02','23:00','18','s','Una fiesta dedicada a la banda callejera más grande y popular de Rio Canrnival. Teniendo lugar la noche anterior al desfile de la calle Cordão do Bola Preta, el baile contará con distinguidos sambistas del famoso bloco Bola Preta tocando las canciones bohemias que los convierten en algunos de los artistas más reconocidos de Brasil.',400,2390),
      ('2013',DEFAULT,'g','20-03','21:30','10','s','NULL',80,3419),
      ('2012',DEFAULT,'g','20-01','10:30','18','s','Es una noche dedicada a una de las bebidas favoritas de los cariocas: la Cerveja (cerveza). En este el ¡Viva la Cerveza! Ball disfrutarás de un suministro ilimitado de cerveza gratis y de fondo escucharás el ritmo palpitante de la mejor música del Carnaval de Río.',500,2381),
      ('2012',DEFAULT,'d','19-02','22:00','10','s','Es una mezcla única de arte, cultura, música y celebración.',160,2347),
      ('2013',DEFAULT,'d','09-02','21:00','10','s','En este desfile, las escuelas de samba campeonas de cada ciudad tienen la oportunidad de mostrar nuevamente sus elaboradas y espectaculares presentaciones. Cada escuela de samba presenta su tema central a través de carrozas, trajes elaborados, música y danzas.',385.73,4523);

INSERT INTO ama_participaciones 
VALUES(    

INSERT INTO ama_roles
VALUES(

INSERT INTO ama_detalles_reservas
VALUES(967,458,2),
      (128,719,2),
      (359,603,1),
      (746,895,3),
      (682,276,4),
      (513,531,5),
      (735,684,7),
      (888,192,3),
      (943,347,2);

INSERT INTO ama_entradas
VALUES('2011',DEFAULT,1,'12:00','12-02-2011',967),
      ('2011',DEFAULT,2,'5:00','11-01-2011',128),
      ('2011',DEFAULT,3,'8:00','06-12-2010',359),
      ('2012',DEFAULT,4,'9:00','15-05-2011',746),
      ('2012',DEFAULT,5,'15:00','16-09-2011',682),
      ('2012',DEFAULT,6,'16:00','01-02-2012',513),
      ('2013',DEFAULT,7,'10:00','05-10-2012',735),
      ('2013',DEFAULT,8,'14:00','06-01-2013',888),
      ('2013',DEFAULT,9,'13:00','18-12-2012',943);

INSERT INTO ama_historicos_precios 
VALUES(    

commit;