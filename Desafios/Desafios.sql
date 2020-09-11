CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE LIVROS(
	NOME_DO_LIVRO VARCHAR(80) NOT NULL UNIQUE,
    NOME_DO_AUTOR VARCHAR(90) NOT NULL,
	SEXO_DO_AUTOR CHAR(1) NOT NULL,
    NUMERO_DE_PAGINAS SMALLINT NOT NULL,
    NOME_DA_EDITORA VARCHAR(90) NOT NULL,
	VALOR_DO_LIVRO DECIMAL(6,2) NOT NULL,
    ESTADO_DA_EDITORA CHAR(2) NOT NULL,
    ANO_PUBLICADO SMALLINT NOT NULL 
);

INSERT INTO LIVROS (
	NOME_DO_LIVRO,
    NOME_DO_AUTOR,
    SEXO_DO_AUTOR,
    NUMERO_DE_PAGINAS,
    NOME_DA_EDITORA,
	VALOR_DO_LIVRO,
    ESTADO_DA_EDITORA, 
    ANO_PUBLICADO 
) VALUES(
	'Cavaleiro Real',
    'Ana Claudia',
    'F',
	465,
    'Atlas',
    '49.90',
    'RJ',
    2009 
), (
	'SQL para leigos',
    'João Nunes',
    'M',
	450,
    'Addison',
    '98.00',
    'SP',
    2018 
), (
	'Receitas Caseiras',
    'Celia Tavares',
    'F',
	210,
    'Atlas',
    '45.00',
    'RJ',
    2008 
), (
	'Pessoas Efetivas',
    'Eduardo Santos',
    'M',
	390,
    'Beta',
    '78.99',
    'RJ',
    2018 
), (
	'Habitos Saudáveis',
    'Eduardo Santos',
    'M',
	630,
    'Beta',
    '150.98',
    'RJ',
    2019 
), (
	'A Casa Marrom',
    'Hermes Macedo',
    'M',
	250,
    'Bubba',
    '60.00',
    'MG',
    2016 
), (
	'Estacio Querido',
    'Geraldo Francisco',
    'M',
	310,
    'Insignia',
    '100.00',
    'ES',
    2015 
), (
	'Pra Sempre Amigas',
    'Leda Silva',
    'F',
	510,
    'Insignia',
    '78.98',
    'ES',
    2011 
), (
	'Copas Inesqueciveis',
    'Marco Alcantara',
    'M',
	200,
    'Larson',
    '130.98',
    'RS',
    2018 
), (
	'O Poder de Mente',
    'Clara Mafra',
    'F',
	120,
    'Continental',
    '56.98',
    'SP',
    2017 
);

# 1

SELECT NOME_DO_LIVRO,
    NOME_DO_AUTOR,
    SEXO_DO_AUTOR,
    NUMERO_DE_PAGINAS,
    NOME_DA_EDITORA,
	VALOR_DO_LIVRO,
    ESTADO_DA_EDITORA, 
    ANO_PUBLICADO
FROM LIVROS;

# 2

SELECT NOME_DO_LIVRO,
    NOME_DA_EDITORA
FROM LIVROS;

# 3

SELECT NOME_DO_LIVRO,
	ESTADO_DA_EDITORA
FROM LIVROS
WHERE SEXO_DO_AUTOR = 'M';

# 4 

SELECT NOME_DO_LIVRO,
	NUMERO_DE_PAGINAS
FROM LIVROS
WHERE SEXO_DO_AUTOR = 'F';

# 5

SELECT VALOR_DO_LIVRO
FROM LIVROS
WHERE ESTADO_DA_EDITORA = 'SP';






select * from LIVROS;

truncate LIVROS;

/* DROP TABLE LIVROS; */

DROP TABLE LIVROS;

DESC LIVROS;