-- Criando a Tabela TB_ENDERECO":

CREATE TABLE cap16."TB_ENDERECO"
(
    "id_end" integer NOT NULL,
    "rua" character varying(30),
    "numero" character varying(30),
    "bairro" character varying(30),
    "cep" character varying(10),
    "estado" character varying(30),
    "pais" character varying(30),
    "id_func" integer,
    PRIMARY KEY ("id_end")
)

TABLESPACE pg_default;

ALTER TABLE cap16."TB_ENDERECO"
    OWNER to postgres;