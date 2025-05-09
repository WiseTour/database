USE WiseTour;

select * from Fonte_Dados;

select * from Empresa;

select * from Funcionario;

select * from Fonte_Dados;

select * from Log;

SELECT * FROM Chegada_Turistas_Internacionais_Brasil_Mensal LIMIT 100000;
SELECT SUM(chegadas) AS total_chegadas
FROM Chegada_Turistas_Internacionais_Brasil_Mensal;


SELECT * FROM Perfil_Estimado_Turistas LIMIT 100000;
SELECT SUM(quantidade_turistas) AS total_chegadas
FROM Perfil_Estimado_Turistas;

