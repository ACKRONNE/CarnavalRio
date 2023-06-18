-- I N S E R C C I O N  D E  D A T O S

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
      (101,'Desfile del Bloque Noivas Do Parú','Praia de Itaguaçu'),
      (102,'Baile Gay del Scala','Scala nigth Club. Avenida Treze de Maio 23, Centro'),
      (103,'The City Ball','Rua 13 de Maio, 23, Centro de Río de Janeiro.'),
      (104,'Bola Preta Ball','Scala nigth Club. Avenida Treze de Maio 23, Centro'),
      (105,'Meu e Seu','Harmonia Do Samba'),
      (106,'Beer Ball','Scala Rio Nightclub: Avenida Treze de Maio 23, Centro'),
      (107,'Special Group 1','Sambódromo Profesor Darcy Ribeiro'),
      (108,'Champion’s Parade','Sambódromo Profesor Darcy Ribeiro');

INSERT INTO ama_regiones_rio 
VALUES(

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
VALUES(161,171,'gp',3,8,'e','a'),
      (162,172,'gf',5,7,'c','b'),
      (163,173,'an',2,4,'a','c'),
      (164,174,'sl',9,11,'e','a/b'),
      (165,175,'gf',1,6,'c','c/d'),
      (166,176,'an',4,9,'a','b'),
      (167,177,'gp',7,3,'c','a'),
      (168,178,'sl',10,5,'e','a/b'),
      (169,179,'an',6,2,'a','c');

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
VALUES

INSERT INTO ama_hist_grupos 
VALUES(

INSERT INTO ama_protagonistas 
VALUES

INSERT INTO ama_carnavales_anuales
VALUES(2011,'04-03-2011','12-03-2011',DEFAULT),
      (2012,'17-02-2012','25-02-2012',DEFAULT),
      (2013,'08-02-2013','16-02-2013',DEFAULT);

INSERT INTO ama_eventos 
VALUES('2011',190,'g','05-03','22:00','18','s','Se caracteriza por su energía, ritmo y espiritualidad. Los bailarines utilizan movimientos fluidos y expresivos que reflejan una conexión profunda con la música y los ritmos africanos, como la samba, el candomblé y la capoeira. A través de la danza, se busca establecer una comunicación con lo divino y los espíritus, canalizando su poder y energía para el beneficio personal y colectivo.',2410.82,100),
('2011',191,'g','06-03','15:00','16','s','NULL',50,101),
('2012',192,'g','21-02','23:00','18','s','En la noche del Gay Ball, la alfombra roja fuera del Scala Nightclub se reemplaza por una rosa, ya que este evento notoriamente fabuloso atrae a grandes multitudes de drag queens y sus admiradores. Los escandalosos atuendos de la notoria “alfombra rosa” del Gay Scala Ball atraen a los medios ya las celebridades. Drag kings y queens compiten por la atención mientras hacen sus grandes entradas en el Scala Nightclub.',1000,102),
('2012',193,'g','18-02','9:00','10','s','El baile contará con distinguidos sambistas del famoso bloco Bola Preta tocando las canciones bohemias que los convierten en algunos de los artistas más reconocidos de Brasil. Se espera que grandes nombres como João Roberto Kelly, Luiz Camillo y Dominguinhos se presenten en el inolvidable Cordão do Bola Preta Ball.',1200,103),
('2013',194,'g','17-02','23:00','18','s','Una fiesta dedicada a la banda callejera más grande y popular de Rio Canrnival. Teniendo lugar la noche anterior al desfile de la calle Cordão do Bola Preta, el baile contará con distinguidos sambistas del famoso bloco Bola Preta tocando las canciones bohemias que los convierten en algunos de los artistas más reconocidos de Brasil.',400,104),
('2013',195,'g','20-03','21:30','10','s','NULL',80,105),
('2012',196,'g','20-01','10:30','18','s','Es una noche dedicada a una de las bebidas favoritas de los cariocas: la Cerveja (cerveza). En este el ¡Viva la Cerveza! Ball disfrutarás de un suministro ilimitado de cerveza gratis y de fondo escucharás el ritmo palpitante de la mejor música del Carnaval de Río.',500,106),
('2012',197,'d','19-02','22:00','10','s','Es una mezcla única de arte, cultura, música y celebración.',160,107),
('2013',198,'d','09-02','21:00','10','s','En este desfile, las escuelas de samba campeonas de cada ciudad tienen la oportunidad de mostrar nuevamente sus elaboradas y espectaculares presentaciones. Cada escuela de samba presenta su tema central a través de carrozas, trajes elaborados, música y danzas.',385.73,108);

INSERT INTO ama_participaciones 
VALUES(    

INSERT INTO ama_roles
VALUES(

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
VALUES('2011',DEFAULT,210,'12:00','12/02/2011',180),
      ('2011',DEFAULT,211,'5:00','11/01/2011',181),
      ('2011',DEFAULT,212,'8:00','06/12/2010',182),
      ('2012',DEFAULT,213,'9:00','15/05/2011',183),
      ('2012',DEFAULT,214,'15:00','16/09/2011',184),
      ('2012',DEFAULT,215,'16:00','01/02/2012',185),
      ('2013',DEFAULT,216,'10:00','05/10/2012',186),
      ('2013',DEFAULT,217,'14:00','06/01/2013',187),
      ('2013',DEFAULT,218,'13:00','18/12/2012',188);

INSERT INTO ama_historicos_precios 
VALUES(    

commit;