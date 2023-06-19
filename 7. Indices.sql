-- I N D I C E S  D E  F K 

CREATE INDEX in_rese ON ama_reservas (id_cliente);
CREATE INDEX in_escu ON ama_escuelas_samba (id_region);
CREATE INDEX in_prot ON ama_protagonistas (id_escuela);
CREATE INDEX in_carn ON ama_carnavales_anuales (id_momo);
CREATE INDEX in_carn ON ama_carnavales_anuales (id_reina);
CREATE INDEX in_even ON ama_eventos (id_lugar);
CREATE INDEX in_entr ON ama_entradas (id_reservas);