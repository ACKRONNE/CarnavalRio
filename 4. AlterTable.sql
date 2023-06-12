-- -- Modificar tablas

--      G L O S A R I O
--
-- ckc | check en tabla cliente
-- ukc | unique en tabla cliente
-- uke | unique en tabla empresa
-- fka | foreing key en tabla autorizacion
-- ckt | check en tabla tipos_entrada
-- pkt | foreing key en tabla tipos_entrada
-- ukr | unique en tabla reserva
-- fkr | foreing key en tabla reserva

ALTER TABLE clientes
ADD CONSTRAINT ckc_naciona      CHECK (nacionalidad IN ('n', 'e')),
ADD CONSTRAINT ukc_dni		    UNIQUE (dni),
ADD CONSTRAINT ukc_correo	    UNIQUE (correo);

ALTER TABLE empresas
ADD CONSTRAINT uke_correo       UNIQUE (correo);

ALTER TABLE autorizaciones
ADD CONSTRAINT  fka_auto_emp    FOREIGN KEY     (id_empresa)    REFERENCES  empresas (id_empresa);

ALTER TABLE tipos_entrada
ADD CONSTRAINT ckt_tipoEnt      CHECK (tipo_ent IN ('gp','gf','an','sl')),
ADD CONSTRAINT ckt_sector       CHECK ((sector >= 1) AND (sector <= 11)),
ADD CONSTRAINT ckt_calidad      CHECK ((calidad >= 1) AND (calidad <= 11)),
ADD CONSTRAINT ckt_tipDesfile   CHECK (tipo_des IN ('e', 'c', 'a')),
ADD CONSTRAINT ckt_ubi          CHECK (ubi IN ('a', 'b','c', 'a/b', 'c/d')),
ADD CONSTRAINT pkt_tipos_ent    PRIMARY KEY (id_empresa, id_tipo);

ALTER TABLE reserva
ADD CONSTRAINT ukr_idcli        UNIQUE (id_cliente),
ADD CONSTRAINT fkr_reser        FOREIGN KEY    (id_cliente)     REFERENCES clientes(id_cliente);

ALTER TABLE escuelas_samba
ADD CONSTRAINT ukes_idreg       UNIQUE (id_region),
ADD CONSTRAINT fkes_escu        FOREIGN KEY    (id_region)      REFERENCES regiones_rio(id_region);

ALTER TABLE hist_grupo
ADD CONSTRAINT ckh_grupo        CHECK (grupo IN ('a','e')),
ADD CONSTRAINT pkh_histgr       PRIMARY KEY (id_escuela, fecha_ini),
ADD CONSTRAINT fkh_histgr       FOREIGN KEY    (id_escuela)     REFERENCES escuelas_samba(id_escuela);

ALTER TABLE protagonistas
ADD CONSTRAINT ckp_gen          CHECK (genero IN ('f','m')),
ADD CONSTRAINT ukp_dni          UNIQUE (dni),
ADD CONSTRAINT ukp_idesc        UNIQUE (id_escuela),
ADD CONSTRAINT fkp_idesc        FOREIGN KEY    (id_escuela)     REFERENCES escuelas_samba(id_escuela);

-- Aqui falta decir que el momo va a ser el hombre y reina la mujer creo que va a dar error de ejecucion
ALTER TABLE carnavales_anual
ADD CONSTRAINT fkca_momo        FOREIGN KEY    (id_prota)      REFERENCES protagonistas(id_prota);

ALTER TABLE eventos
ADD CONSTRAINT ckev_tipo        CHECK (tipo IN ('g','d')),
ADD CONSTRAINT ckev_pago        CHECK (pago IN ('s','n')),
ADD CONSTRAINT pkev_eve         PRIMARY KEY (ano, id_evento),
ADD CONSTRAINT fkev_ano         FOREIGN KEY (ano)           REFERENCES carnavales_anual(ano),
ADD CONSTRAINT fkev_lug         FOREIGN KEY (id_lugar)      REFERENCES lugares_evento(id_lugar);

ALTER TABLE participacion
ADD CONSTRAINT pkpa_part        PRIMARY KEY (id_escuela, fecha_ini, id_evento),
ADD CONSTRAINT fkpa_idesc       FOREIGN KEY (id_escuela)     REFERENCES escuelas_samba(id_escuela),
ADD CONSTRAINT fkpa_fini        FOREIGN KEY (fecha_ini)      REFERENCES hist_grupo(fecha_ini),
ADD CONSTRAINT fkpa_idev        FOREIGN KEY (id_evento)      REFERENCES eventos(id_evento);

ALTER TABLE rol
ADD CONSTRAINT pkro_rol         PRIMARY KEY (id_prota, id_escuela, fecha_ini,id_evento),
ADD CONSTRAINT fkro_idpro       FOREIGN KEY (id_prota)       REFERENCES protagonistas(id_prota),
ADD CONSTRAINT fkro_idesc       FOREIGN KEY (id_escuela)     REFERENCES escuelas_samba(id_escuela),
ADD CONSTRAINT fkro_fini        FOREIGN KEY (fecha_ini)      REFERENCES hist_grupo(fecha_ini),
ADD CONSTRAINT fkro_ideve       FOREIGN KEY (id_evento)      REFERENCES eventos(id_evento),
ADD CONSTRAINT ckro_name        CHECK (nombre IN ('c','m','p'));

ALTER TABLE detalle_reserva
ADD CONSTRAINT pkde_res         PRIMARY KEY (id_reserva, id_empresa),
ADD CONSTRAINT fkde_idres       FOREIGN KEY (id_reserva)      REFERENCES reserva(id_reserva),
ADD CONSTRAINT fkde_idemp       FOREIGN KEY (id_empresa)      REFERENCES empresa(id_empresa);

ALTER TABLE entrada
ADD CONSTRAINT uken_idres        UNIQUE (id_reserva),
ADD CONSTRAINT pken_entra        PRIMARY KEY (ano, id_evento, id_entrada),
ADD CONSTRAINT fken_ano          FOREIGN KEY (ano)            REFERENCES carnavales_anual(ano),
ADD CONSTRAINT fken_ideve        FOREIGN KEY (id_evento)      REFERENCES eventos(id_evento),
ADD CONSTRAINT fkde_idres        FOREIGN KEY (id_reserva)     REFERENCES reserva(id_reserva);

ALTER TABLE historico_precio
ADD CONSTRAINT pkhp_histpre      PRIMARY KEY (id_empresa, id_tipo, ano, id_evento, id_entrada, fecha_inicio),
ADD CONSTRAINT fkhp_idemp        FOREIGN KEY (id_empresa)      REFERENCES empresa(id_empresa),
ADD CONSTRAINT fkhp_idtip        FOREIGN KEY (id_tipo)         REFERENCES tipos_entrada(id_tipo),
ADD CONSTRAINT fken_ano          FOREIGN KEY (ano)             REFERENCES carnavales_anual(ano),
ADD CONSTRAINT fkhp_ideve        FOREIGN KEY (id_evento)       REFERENCES eventos(id_evento),
ADD CONSTRAINT fkhp_ident        FOREIGN KEY (id_entrada)      REFERENCES entrada(id_entrada);