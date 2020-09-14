/* triggers é uma forma de representar eventos

	DDL – Data Definition Language
    
    CREATE 	Cria uma nova tabela, visão ou outro objeto no BD.
    
	ALTER 	Modifica um objeto existente no BD, como uma tabela.
    
	DROP 	Exclui uma tabela inteira, uma exibição de uma tabela ou outro objeto no banco de dados.
    
    DML – Data Manipulation Language
    
    INSERT 	Cria um registro (linha)
	UPDATE 	Modifica registros
	DELETE 	Exclui registros
    
    DCL – Data Control Language
    
    GRANT 	Dá privilégios a um usuário
	REVOKE 	Retira privilégios fornecidos a um usuário
    
    DQL – Data Query Language
    
    SELECT 	Obtém registros especificados de uma ou mais tabelas. (consulta)
    
	Restrições de integridade serve para relacionamentos 
    
    Procedimentos armazenados são pequenas rotinas que pode ser usasda 
    
    indice = busca mais rápidas, organização de dados
    
    campo = coluna
    registro = linha
    
    EOF = end of file
*/

#ddl
create database db_equippe2;

# ou
create schema db_equippe2;

/* 
	ideal é o database 
	if not exists  evita mensagem de erro caso o banco ja exista
*/ 

create database if not exists db_equippe2;

# comando para a exclusão de banco de dados
/* 	
	drop database funciona tanto para criados com database
    ou com schema e vice-versuser_summarya
*/

drop database if exists db_equippe2;
