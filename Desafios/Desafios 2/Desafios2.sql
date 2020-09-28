create database exercicio;

use exercicio;

# criando tabelas 

/* 
	Antes de fazer um função de analises no banco de dados 
    veja se está em um momento pouco movimentado para o banco 
    por quê analises demandam muito do processamento do banco 
    e isso pode acabar afetamndo o sistema
 */

create table funcionarios(
      idFuncionario integer,
      nome varchar(100),
      email varchar(200),
      sexo varchar(10),
      departamento varchar(100),
      admissao varchar(10),
      salario integer,
      cargo varchar(100),
      idRegiao int
  );
  
# projeções

select * from funcionarios;

# 1-  
  
select count(nome) as Quantidade, departamento as "Departamento"
from funcionarios
where departamento = "Roupas"
or departamento = "Filmes"
group by departamento
order by Quantidade;

select *
from funcionarios
where departamento = "Roupas"
or departamento = "Filmes"
order by departamento;

# 2- 

select * 
from funcionarios
where sexo = "FEMININO"
and (departamento = 'Lar' or departamento = 'Filmes' )
order by departamento;

# 3- 

select * 
from funcionarios 
where sexo = "Masculino" 
or departamento = "Jardim"
order by departamento;






 
 
 


