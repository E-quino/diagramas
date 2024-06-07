CREATE TABLE usuario (
    id BIGINT PRIMARY KEY,
    email VARCHAR(100),
    senha VARCHAR(100),
    FOREIGN KEY (id) REFERENCES atleta(usuario),
    FOREIGN KEY (id) REFERENCES cavalo(usuario),
    FOREIGN KEY (id) REFERENCES entidade(usuario),
);

CREATE TABLE atleta (
    id BIGINT PRIMARY KEY,
    usuario BIGINT,
    nome VARCHAR(100),
    nascimento date,
    documento VARCHAR(100),
    FOREIGN KEY (id) REFERENCES inscricao(atleta),
);

CREATE TABLE cavalo (
    id BIGINT PRIMARY KEY,
    usuario BIGINT,
    nome VARCHAR(100),
    FOREIGN KEY (id) REFERENCES inscricao(cavalo),
);

CREATE TABLE entidade (
    id VARCHAR(100) PRIMARY KEY,
    usuario BIGINT,
    nome VARCHAR(100),
    endereco VARCHAR(300),
    FOREIGN KEY (id) REFERENCES evento(entidade),
);

CREATE TABLE evento (
    id BIGINT PRIMARY KEY,
    entidade BIGINT,
    nome VARCHAR(150),
    descricao VARCHAR(400),
    inicio date,
    fim date,
    FOREIGN KEY (id) REFERENCES dia(evento),
    FOREIGN KEY (id) REFERENCES inscricao(evento)
);

CREATE TABLE inscricao (
    id BIGINT PRIMARY KEY,
    atleta BIGINT,
    cavalo BIGINT,
    dia BIGINT,
    evento BIGINT,
    altura BIGINT,
    categoria BIGINT
    FOREIGN KEY (id) REFERENCES altura(id),
    FOREIGN KEY (id) REFERENCES categoria(id),
);

CREATE TABLE dia (
    id BIGINT PRIMARY KEY,
    evento BIGINT,
    data date,
    FOREIGN KEY (id) REFERENCES inscricao(dia),
    FOREIGN KEY (id) REFERENCES altura(dia),
);

CREATE TABLE altura (
    id BIGINT PRIMARY KEY,
    dia BIGINT,
    altura VARCHAR(30),
    FOREIGN KEY (id) REFERENCES categoria(altura),
);

