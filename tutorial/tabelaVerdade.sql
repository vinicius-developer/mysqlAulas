USE LIVRARIA;

SHOW TABLES;

/* Tabela verdade em mysql funcionar muito parecido com as tabelas
verdades de outras linguagens de programação, porém aqui a sintaxe 
dois operadores são OR ou AND */

/*			
		Exemplo tabela
	A | B | A OR B | A AND B |
	V | V |   V    |    V	 |
    V | F |   V    |	F	 |
    F | V |	  V    |	F    |
	F | F |	  F    |	F    |

	Para o operador OR sómente uma das duas precisa ser verdadeiro
    
    Para o operador AND os dois precisam se verdadeiro
    
    Outra forma de chamar essa relação entre os operadores é de 
    matemática discreta
*/

/*
 Aqui usamos os operdadores lógicos para fazer projeções do banco de dados
 as duas fazem a mesma coisa porém com código diferente
*/

SELECT NOME_DO_AUTOR, SEXO_DO_AUTOR, ESTADO_DA_EDITORA
FROM LIVROS
WHERE SEXO_DO_AUTOR = 'M' 
AND ESTADO_DA_EDITORA = "SP"
OR SEXO_DO_AUTOR = 'M' 
AND ESTADO_DA_EDITORA = 'RJ';

# Essa é outra forma de fazer o exercício

select NOME_DO_AUTOR, SEXO_DO_AUTOR, ESTADO_DA_EDITORA 
from LIVROS
where SEXO_DO_AUTOR = 'M' 
and (ESTADO_DA_EDITORA = 'SP' or ESTADO_DA_EDITORA = 'RJ');


/* FUNÇÕES DE AGREGAÇÃO */

# função conunt conta todos os registros que vieram
# na projeção 

select count(*) as "Todos os Registros da Tabela Livros"
from livros;

# com operadaor group by

# com group by ele agrupa atributos iguais nesse casos o escolhido
# foi nome do autor, mas poderia ser qualquer outro registro
# (não vale a pena usar em atributos unicos)
# então o count vai contar quantos livros tem cada autor

select nome_do_autor,
count(*) as "Todos os Registros unicos da Tebela Livros"
from livros
group by nome_do_autor;

# quando utilizar a tabela verdade com o or 
# lembre-se de sempre usar o dado que verdade mais vezes primeiro 



 

