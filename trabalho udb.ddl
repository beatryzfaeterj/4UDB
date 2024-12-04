CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    cpf VARCHAR2(14) NOT NULL,
    contato VARCHAR2(50),
    cep VARCHAR2(10),
    bairro VARCHAR2(50),
    cidade VARCHAR2(50),
    estado VARCHAR2(2),
    logradouro VARCHAR2(100),
    numero VARCHAR2(10),
    complemento VARCHAR2(50)
);

CREATE TABLE Animal (
    id INT PRIMARY KEY,
    nomeCliente INT NOT NULL,
    nome VARCHAR2(100),
    raca VARCHAR2(50),
    cor VARCHAR2(30),
    idade INT,
    especie VARCHAR2(50),
    problemas_saude VARCHAR2(500),
    nascimento DATE,
    foto BLOB,
    CONSTRAINT fk_Animal_Cliente FOREIGN KEY (nomeCliente) REFERENCES Cliente(nome)
);

CREATE TABLE Agenda (
    id INT PRIMARY KEY,
    nomeCliente INT NOT NULL,
    nomeAnimal INT NOT NULL,
    data_hora TIMESTAMP,
    descricao VARCHAR2(200),
    valor INT(10,2),
    retirar CHAR(1),
    perfume VARCHAR2(50),
    sexo VARCHAR2(10),
    CONSTRAINT fk_Agenda_Cliente FOREIGN KEY (nomeCliente) REFERENCES Cliente(nome),
    CONSTRAINT fk_Agenda_Animal FOREIGN KEY (nomeAnimal) REFERENCES Animal(nome)
);

CREATE TABLE Consulta (
    id INT PRIMARY KEY,
    nomeCliente INT NOT NULL,
    nomeAnimal INT NOT NULL,
    contato VARCHAR2(50),
    data_hora TIMESTAMP,
    servico_realizado VARCHAR2(200),
    observacoes VARCHAR2(500),
    tipo_atendimento VARCHAR2(50),
    exames VARCHAR2(500),
    valor_consulta INT(10,2),
    valor_vacina INT(10,2),
    valor_vermifugo INT(10,2),
    data_vacina DATE,
    data_retorno DATE,
    CONSTRAINT fk_Consulta_Cliente FOREIGN KEY (nomeCliente) REFERENCES Cliente(nome),
    CONSTRAINT fk_Consulta_Animal FOREIGN KEY (nomeAnimal) REFERENCES Animal(nome)
);

CREATE TABLE Rastreio (
    id INT PRIMARY KEY,
    idCliente INT NOT NULL,
    idAnimal INT NOT NULL,
    etapa VARCHAR2(200),
    CONSTRAINT fk_Rastreio_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente(id),
    CONSTRAINT fk_Rastreio_Animal FOREIGN KEY (idAnimal) REFERENCES Animal(id)
);


CREATE TABLE Login (
    id INT PRIMARY KEY,
    usuario VARCHAR2(50) NOT NULL,
    senha VARCHAR2(100) NOT NULL
);


CREATE TABLE Veterinaria (
    id INT PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    login_id INT UNIQUE,
    CONSTRAINT fk_Login_Veterinaria FOREIGN KEY (login_id) REFERENCES Login(id)
);


CREATE TABLE Administrador (
    id INT PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    login_id INT UNIQUE,
    CONSTRAINT fk_Login_Administrador FOREIGN KEY (login_id) REFERENCES Login(id)
);


