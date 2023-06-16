-- Inserts

INSERT INTO asm_clientes 
VALUES(DEFAULT,'Juan','Perez','Garcia','n','32883',34534646,'juan.perez@gmail.com'),
      (DEFAULT,'Maria','Lopez','Sandoval','e','31250',98765321,'maria.lopez@hotmail.com'),
      (DEFAULT,'Pedro','Rodriguez','Fernandez','n','33678',46789012,'pedro.fernandez@outlook.com'),
      (DEFAULT,'Laura','Ramirez','Santos','n','32452',32198765,'laura.ramirez@gmail.com'),
      (DEFAULT,'Carlos','Gonzalez','Perez','e','35326',21087654,'carlos.gonzalez@apple.com'),
      (DEFAULT,'Gabriela','Ortiz','Gomez','n','32601',87654210,'gabriela.ortiz@hotmail.com'),
      (DEFAULT,'Ricardo','Morales','Hernandez','n','35780',24532890,'ricardo.morales@outlook.com'),
      (DEFAULT,'Luis','Mendez','Reyes','n','34188',54321098,'luis.mendez@apple.com'),
      (DEFAULT,'Alejandro','Vargas','Mendoza','n','33297',78912345,'alejandro.vargas@gmail.com'),
      (DEFAULT,'Manuel','Flores','Lopez','e','36139',890123456,'manuel.flores@apple.com'),
      (DEFAULT,'Carolina','Ramos','Morales','n','35275',45678901,'carolina.ramos@outlook.com');

INSERT INTO ama_lugares_evento 
VALUES(

INSERT INTO ama_regiones_rio 
VALUES(

INSERT INTO ama_empresas 
VALUES(458,'Bookers International','info@bookersinternational.com'),
      (719,'Rio Maximo','info@riomaximo.com'),
      (603,'Rio ticket','Info@rio-Tickets.com'),
      (895,'Carnavales Brasil','info@carnavales-brasil.com'),
      (276,'Rio Carnaval Tickets','riocarnavaltickets@gmail.com'),
      (531,'Trip advisor','northamericapr@tripadvisor.com'),
      (684,'Ticket Rio','riocarnavaltickets@gmail.com'),
      (192,'Rio','info@riocarnaval.com'),
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

INSERT INTO ama_tipos_entrada 
VALUES(DEFAULT,DEFAULT,gp,3,8,'e','a'),
      (DEFAULT,DEFAULT,gf,5,7,'c','b'),
      (DEFAULT,DEFAULT,an,2,4,'a','c'),
      (DEFAULT,DEFAULT,sl,9,11,'e','a/b'),
      (DEFAULT,DEFAULT,gf,1,6,'c','c/d'),
      (DEFAULT,DEFAULT,an,4,9,'a','b'),
      (DEFAULT,DEFAULT,gp,7,3,'c','a'),
      (DEFAULT,DEFAULT,sl,10,5,'e','a/b'),
      (DEFAULT,DEFAULT,an,6,2,'a','c');

INSERT INTO ama_reserva 
VALUES(967,'40558',DEFAULT,1000.25,'40579'),
      (128,'41090',DEFAULT,2500.75,'41105'),
      (359,'41376',DEFAULT,1200.60,'41399'),
      (746,'41154',DEFAULT,800.35,'41172'),
      (682,'40780',DEFAULT,600.90,'40796'),
      (513,'41222',DEFAULT,1500.20,'41243'),
      (735,'41472',DEFAULT,300.75,'41491'),
      (888,'40624',DEFAULT,700.45,'40643'),
      (943,'41561',DEFAULT,1800.30,'41577');

INSERT INTO ama_escuelas_samba 
VALUES(    

INSERT INTO ama_hist_grupo 
VALUES(    

INSERT INTO ama_protagonistas 
VALUES(    

INSERT INTO ama_carnavales_anual 
VALUES(    

INSERT INTO ama_eventos 
VALUES(    

INSERT INTO ama_participacion 
VALUES(    

INSERT INTO ama_rol 
VALUES(

INSERT INTO ama_detalle_reserva 
VALUES(967,458,2),
      (128,719,2),
      (359,603,1),
      (746,895,3),
      (682,276,4),
      (513,531,5),
      (735,684,7),
      (888,192,3),
      (943,347,2);   

INSERT INTO ama_entrada 
VALUES(    

INSERT INTO ama_historico_precio 
VALUES(    

    

commit;