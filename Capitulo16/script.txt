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


INSERT INTO cap16."TB_ENDERECO"(
	"id_end", "rua", "numero", "bairro", "cep", "estado", "pais", "id_func")
	VALUES (1001, 'Jaguar', 40, 'Tijuca', '24239-900', 'Rio de Janeiro', 'Brasil', 2);
	
INSERT INTO cap16."TB_ENDERECO"(
	"id_end", "rua", "numero", "bairro", "cep", "estado", "pais", "id_func")
	VALUES (1002, 'Mercedes Benz', 140, 'Centro', '12098-900', 'Minas Gerais', 'Brasil', 6);

INSERT INTO cap16."TB_ENDERECO"(
	"id_end", "rua", "numero", "bairro", "cep", "estado", "pais", "id_func")
	VALUES (1003, 'BMW', 20, 'Tijuca', '23232-900', 'Rio de Janeiro', 'Brasil', 3);
	
INSERT INTO cap16."TB_ENDERECO"(
	"id_end", "rua", "numero", "bairro", "cep", "estado", "pais", "id_func")
	VALUES (1004, 'Ferrari', 32, 'Centro', '99872-900', 'Minas Gerais', 'Brasil', 11);

INSERT INTO cap16."TB_ENDERECO"(
	"id_end", "rua", "numero", "bairro", "cep", "estado", "pais", "id_func")
	VALUES (1005, 'McLaren', 45, 'Centro', '43982-900', 'Minas Gerais', 'Brasil', 17);
