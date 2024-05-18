-- // CRIAÇÃO DO BANCO DE DADOS

CREATE DATABASE acousticMe;
USE acousticMe;

-- -- // CRIAÇÃO DE TABELAS

-- USUARIO

CREATE TABLE usuario(
	id INT AUTO_INCREMENT,
    nome VARCHAR(45),
    senha VARCHAR(20),    
    dataCriacao DATETIME DEFAULT NOW(),
    PRIMARY KEY (id)
);

SELECT * FROM usuario;	
TRUNCATE usuario;

-- MUSICA

CREATE TABLE musica(
	id INT AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    artista VARCHAR(45),
    descricao VARCHAR(300) NOT NULL,
    acordes VARCHAR(100) NOT NULL,
    genero VARCHAR(45) NOT NULL,
    linkImagem VARCHAR(500) NOT NULL,
    linkVideoOriginal VARCHAR(500) NOT NULL,
    linkVideoDemonstracao VARCHAR(500),
    PRIMARY KEY (id)
);

-- RITMO

CREATE TABLE ritmo(
	id INT AUTO_INCREMENT,
    nome VARCHAR(45),
    ritmo VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);


-- // USUARIO 

ALTER TABLE usuario
ADD COLUMN permissao VARCHAR(13) DEFAULT 'Comum' NOT NULL;

ALTER TABLE usuario
ADD CHECK (permissao IN ("Comum", "Administrador"));

UPDATE usuario
SET permissao = "administrador"
WHERE id = 1;

SELECT * FROM usuario;

-- // MUSICA

SELECT * FROM musica;
SELECT * FROM musica
WHERE id = 1;

INSERT INTO musica(nome, artista,genero, descricao, acordes, linkImagem, linkVideoOriginal, linkVideoDemonstracao)
VALUES
("Imagine", "John Lennon","Rock", "Possui dedilhado alternando entre as notas graves e agudas", " C, C7M, F", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUprp-PRct-lb2q1YQaRtYZam8A3Few_dzNabdxi0BcA&s", "https://www.youtube.com/watch?v=YkgkThdzX-8&pp=ygUIaW1hZ2luZSA%3D", "");


UPDATE musica
SET linkVideoDemonstracao = "https://www.youtube.com/embed/jnlODuBpAa4"
WHERE id = 1;

UPDATE musica
SET nome = "Californication"
WHERE id = 1;

UPDATE musica
SET linkVideoDemonstracao = "https://www.youtube.com/embed/iyVxvZN4le4"
WHERE id = 2;

UPDATE musica
SET linkImagem = "https://i.scdn.co/image/ab67616d0000b2734dcab2c1f3a6ec24f0a2d439"
WHERE id = 2;

ALTER TABLE musica
ADD COLUMN fkRitmo INT, 
ADD CONSTRAINT FOREIGN KEY (fkRitmo) REFERENCES ritmo(id);

-- RITMO

INSERT INTO ritmo(nome, ritmo)
VALUES
('Pop Rock', '↓↓ ↑↑ ↓↑'),
(null, '↓↓↑↑↑ ↓↑↓↑'),
(null, '↓↓↓ ↓↑'),
(null, '↓↓↑ ↑↓↑ ↑↓↑ ↑↓↑');

SELECT * FROM ritmo;

SELECT * FROM musica
LEFT JOIN ritmo
ON musica.fkRitmo = ritmo.id;

	
