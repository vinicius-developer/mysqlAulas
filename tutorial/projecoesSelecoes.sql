USE PROJETO1;

/* comando select */
/* usando o comando select com essa função podemos mostrar datas e horas atuais */
SELECT now();

/* desta forma podemos mostrar um dados qualquer no banco de dados  */
SELECT 123123;

/* desta forma podemos mostrar um dados e dar um nome para a coluna que ele vai estar inserido
isso é extremamente utilizado*/
SELECT 123123 as TESTE;

/* desta foroma podemos mostart duas colunas uma do lado da outra sem necessáriamente elas existirem */
SELECT 123123 as TESTE, 'vincius de paula' as NOME_ALEATORIO;

/* Com esse comando eu posso dar um apelido para a coluna ou seja no banco de dados ela 
tem um nome X porém quando eu exibo ela tem um nome Y, isso se chama elias*/
SELECT nome as cliente, sexo, email from cliente;

/* Podemos misturar na query campos exisstentes e inexistentes no nosso banco de dados*/
SELECT nome as cliente, sexo, email, now() as data_hora from cliente;

/* Podemos também selecionar o registro específico com base no comando WHERE */
SELECT nome, sexo FROM cliente WHERE sexo = 'Q';

SELECT nome, sexo FROM cliente 
WHERE sexo = 'Q';

SELECT nome FROM cliente WHERE sexo = 'Q';

/* Com o operador and podemos fazer uma filtragem por dois */
SELECT nome, sexo FROM cliente 
WHERE sexo = 'Q' AND nome = 'Maria';

SELECT nome, email FROM cliente 
WHERE sexo = 'Q' AND nome = 'Maria' AND 'asd@hotmail.com';

/* Ao invez de usar = para fazer as pesquisas também podemos usar o LIKE 
que vai nos retornar algo semelhante ao nosso objeto de pesquisa */

SELECT nome, email FROM cliente 
WHERE email LIKE "Carlos";

/* Essa função trabalha com um caracter curinga % que vai completar 
e dizer onde ele deve procurar */

SELECT nome, email FROM cliente 
WHERE email LIKE "Carlos%"; 

SELECT nome, email FROM cliente 
WHERE email LIKE "%arlos%";

SELECT nome, email FROM cliente 
WHERE email LIKE "arlos%";

/* O like piora a perfomance do seu banco é preferivel usar igualdade */

