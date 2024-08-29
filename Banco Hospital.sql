create database hospital;

CREATE TABLE Medicos (
    CRM VARCHAR(20) PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Pacientes (
    CPF VARCHAR(20) PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Plano_Saude VARCHAR(100)
);

CREATE TABLE Consultas (
    ID_Consulta INT AUTO_INCREMENT PRIMARY KEY,
    CRM_Medico VARCHAR(20),
    CPF_Paciente VARCHAR(20),
    Data DATE,
    Tipo VARCHAR(20),
    FOREIGN KEY (CRM_Medico) REFERENCES Medicos(CRM),
    FOREIGN KEY (CPF_Paciente) REFERENCES Pacientes(CPF)
);

CREATE TABLE Medicamentos (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Tipo VARCHAR(50),
    Dosagem VARCHAR(50),
    Instrucoes_Uso VARCHAR(255)
);

CREATE TABLE Prescricoes_Medicamentos (
    ID_Consulta INT,
    Codigo_Medicamento INT,
    FOREIGN KEY (ID_Consulta) REFERENCES Consultas(ID_Consulta),
    FOREIGN KEY (Codigo_Medicamento) REFERENCES Medicamentos(Codigo)
);

CREATE TABLE Exames (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Observacao VARCHAR(255),
    Resultado VARCHAR(255)
);

CREATE TABLE Solicitacoes_Exames (
    ID_Consulta INT,
    Codigo_Exame INT,
    FOREIGN KEY (ID_Consulta) REFERENCES Consultas(ID_Consulta),
    FOREIGN KEY (Codigo_Exame) REFERENCES Exames(Codigo)
);


INSERT INTO Medicos (CRM, Nome, Telefone, Email) VALUES
('CRM12345', 'Dr. Matheus Henrico', '(61) 98765-4321', 'dr.matheus@example.com'),
('CRM54321', 'Dra. Wallacy Pinheiro', '(61) 99999-8888', 'dra.wallacy@example.com');


INSERT INTO Pacientes (CPF, Nome, Endereco, Telefone, Plano_Saude) VALUES
('06753948139', 'Yago Rodiques', 'Rua A, 123', '(61) 1234-5678', 'Plano A'),
('01198765432', 'Thiago Apolinario', 'Rua B, 456', '(61) 8765-4321', 'Plano B');


INSERT INTO Consultas (CRM_Medico, CPF_Paciente, Data, Tipo) VALUES
('CRM12345', '12345678901', '2024-04-15', 'Consulta'),
('CRM54321', '98765432109', '2024-04-16', 'Retorno');


INSERT INTO Medicamentos (Nome, Tipo, Dosagem, Instrucoes_Uso) VALUES
('Paracetamol', 'Comprimido', '500mg', '1 comprimido de 6 em 6 horas'),
('Dipirona', 'Comprimido', '500mg', '1 comprimido de 8 em 8 horas');


INSERT INTO Prescricoes_Medicamentos (ID_Consulta, Codigo_Medicamento) VALUES
(1, 1),
(2, 2);


INSERT INTO Exames (Nome, Observacao, Resultado) VALUES
('Hemograma', 'Nenhuma observação', 'Normal'),
('Raio-X', 'Observação: Suspeita de fratura', 'Fratura identificada');


INSERT INTO Solicitacoes_Exames (ID_Consulta, Codigo_Exame) VALUES
(1, 1), 
(2, 2); 

select * from consultas,exames,medicamentos,medicos,pacientes,prescricoes_medicamentos,solicitacoes_exames;


