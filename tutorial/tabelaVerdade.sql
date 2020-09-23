USE LIVRARIA;

SHOW TABLES;

/* Tabela verdade em mysql funcionar muito parecido com as tabelas
verdades de outras linguagens de programação, porém aqui a sintaxe 
dois operadores são OR ou AND */

/*			Exemplo tabela
	A | B | A OR B | A AND B |
	V | V |   V    |    V	 |
    V | F |   V    |	F	 |
    F | V |	  V    |	F    |
	F | F |	  F    |	F    |

	Para o operador OR sómente uma das duas precisa ser verdadeiro
    
    Para o operador AND os dois precisam se verdadeiro
    
    
    
*/