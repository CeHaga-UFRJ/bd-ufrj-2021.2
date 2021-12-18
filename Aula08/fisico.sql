CREATE TABLE Filme (
    id INT PRIMARY KEY,
    titulo VARCHAR(255),
    ano_lancamento INT
);

CREATE TABLE Genero (
    nome VARCHAR(255) PRIMARY KEY
);

CREATE TABLE Ator (
    id INT PRIMARY KEY,
    nome_artistico VARCHAR(255),
    sexo CHAR(1),
    data_nascimento DATE
);

CREATE TABLE Usuario (
    apelido VARCHAR(255) PRIMARY KEY,
    email VARCHAR(255),
    senha VARCHAR(255)
);

CREATE TABLE Pertence (
    fk_Genero_nome VARCHAR(255),
    fk_Filme_id INT,
    PRIMARY KEY (fk_Genero_nome, fk_Filme_id)
);

CREATE TABLE Avalia (
    fk_Usuario_apelido VARCHAR(255),
    fk_Filme_id INT,
    data DATE,
    nota INT,
    critica TEXT,
    PRIMARY KEY (fk_Usuario_apelido, fk_Filme_id),
    CONSTRAINT CHK_Critica CHECK(critica>=1 AND critica<=10)
);

CREATE TABLE Atua (
    fk_Filme_id INT,
    fk_Ator_id INT,
    papel VARCHAR(255),
    PRIMARY KEY (fk_Filme_id, fk_Ator_id, papel)
);
 
ALTER TABLE Pertence ADD CONSTRAINT FK_Pertence_1
    FOREIGN KEY (fk_Genero_nome)
    REFERENCES Genero (nome);
 
ALTER TABLE Pertence ADD CONSTRAINT FK_Pertence_2
    FOREIGN KEY (fk_Filme_id)
    REFERENCES Filme (id);
 
ALTER TABLE Avalia ADD CONSTRAINT FK_Avalia_1
    FOREIGN KEY (fk_Usuario_apelido)
    REFERENCES Usuario (apelido);
 
ALTER TABLE Avalia ADD CONSTRAINT FK_Avalia_2
    FOREIGN KEY (fk_Filme_id)
    REFERENCES Filme (id);
 
ALTER TABLE Atua ADD CONSTRAINT FK_Atua_2
    FOREIGN KEY (fk_Filme_id)
    REFERENCES Filme (id);
 
ALTER TABLE Atua ADD CONSTRAINT FK_Atua_3
    FOREIGN KEY (fk_Ator_id)
    REFERENCES Ator (id);
