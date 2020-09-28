use exercicio;

/* 

	Antes de iniciar é interessante detacar que para fazer projeções em objetos 
	nulos usamos o (is) ou invés do (=) 

	select * 
	from funcionarios
	where email is null;

	desta forma

*/

# para rodar o update por der feito dessa forma 

# update funcionarios set email = 'teste';

# porém dessa forme mudaria todas as informações do banco  

update funcionatios set email = 'teste' where email = 'rkelley0@soundcloud.com'

# desta forma ele vai mudar somente o campo que é igual ao where







