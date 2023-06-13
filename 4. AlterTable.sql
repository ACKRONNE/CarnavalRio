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
-- fkes| foreing key en tabla escuelas
-- ukes| unique en tabla escuelas

ALTER TABLE ama_autorizaciones
ADD CONSTRAINT  fka_auto_emp    FOREIGN KEY     (id_empresa)    REFERENCES  ama_empresas (id_empresa);

ALTER TABLE ama_tipos_entrada
ADD CONSTRAINT fkt_emp_tip      FOREIGN KEY     (id_empresa)    REFERENCES  ama_empresas (id_empresa);

ALTER TABLE ama_reserva
ADD CONSTRAINT fkr_reser        FOREIGN KEY    (id_cliente)     REFERENCES ama_clientes(id_cliente);

ALTER TABLE ama_escuelas_samba
ADD CONSTRAINT fkes_escu        FOREIGN KEY    (id_region)      REFERENCES ama_regiones_rio(id_region);

ALTER TABLE ama_hist_grupo
ADD CONSTRAINT fkhg_idesc 		FOREIGN KEY    (id_escuela)     REFERENCES ama_escuelas_samba(id_escuela);

ALTER TABLE ama_protagonistas
ADD CONSTRAINT fkp_idesc        FOREIGN KEY    (id_escuela)     REFERENCES ama_escuelas_samba(id_escuela);

ALTER TABLE ama_carnavales_anual
ADD CONSTRAINT fkca_prota       FOREIGN KEY    (id_prota)       REFERENCES ama_protagonistas(id_prota);

ALTER TABLE ama_eventos
ADD CONSTRAINT fkev_ano         FOREIGN KEY    (ano)            REFERENCES ama_carnavales_anual(ano),
ADD CONSTRAINT fkev_lug         FOREIGN KEY    (id_lugar)       REFERENCES ama_lugares_evento(id_lugar);

ALTER TABLE ama_participacion
ADD CONSTRAINT fkpa_idesc       FOREIGN KEY (id_escuela)        REFERENCES ama_escuelas_samba(id_escuela),
ADD CONSTRAINT fkpa_fini        FOREIGN KEY (fecha_ini)         REFERENCES ama_hist_grupo(fecha_ini),
ADD CONSTRAINT fkpa_idev        FOREIGN KEY (id_evento)         REFERENCES ama_eventos(id_evento);

ALTER TABLE ama_rol
ADD CONSTRAINT fkro_idpro       FOREIGN KEY (id_prota)          REFERENCES ama_protagonistas(id_prota),
ADD CONSTRAINT fkro_idesc       FOREIGN KEY (id_escuela)        REFERENCES ama_escuelas_samba(id_escuela),
ADD CONSTRAINT fkro_fini        FOREIGN KEY (fecha_ini)         REFERENCES ama_hist_grupo(fecha_ini),
ADD CONSTRAINT fkro_ideve       FOREIGN KEY (id_evento)         REFERENCES ama_eventos(id_evento);

ALTER TABLE ama_detalle_reserva
ADD CONSTRAINT fkde_idres       FOREIGN KEY (id_reserva)        REFERENCES ama_reserva(id_reserva),
ADD CONSTRAINT fkde_idemp       FOREIGN KEY (id_empresa)        REFERENCES ama_empresas(id_empresa);

ALTER TABLE ama_entrada
ADD CONSTRAINT fken_ano          FOREIGN KEY (ano)              REFERENCES ama_carnavales_anual(ano),
ADD CONSTRAINT fken_ideve        FOREIGN KEY (id_evento)        REFERENCES ama_eventos(id_evento),
ADD CONSTRAINT fken_idres        FOREIGN KEY (id_reserva)       REFERENCES ama_reserva(id_reserva);

ALTER TABLE ama_historico_precio
ADD CONSTRAINT fkhp_idemp        FOREIGN KEY (id_empresa)       REFERENCES ama_empresas(id_empresa),
ADD CONSTRAINT fkhp_idtip        FOREIGN KEY (id_tipo)          REFERENCES ama_tipos_entrada(id_tipo),
ADD CONSTRAINT fkhp_ano          FOREIGN KEY (ano)              REFERENCES ama_carnavales_anual(ano),
ADD CONSTRAINT fkhp_ideve        FOREIGN KEY (id_evento)        REFERENCES ama_eventos(id_evento),
ADD CONSTRAINT fkhp_ident        FOREIGN KEY (id_entrada)       REFERENCES ama_entrada(id_entrada);