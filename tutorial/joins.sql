use db_faculdade;

/* tipo de joins */

/* 
	Nesse caso temos na tabela cursos
    o nome do curso escrito por extenso 
    enquanto na tabela alunos so temos o 
    id do curso
*/

select * from tbl_alunos;

select * from tbl_cursos;

/*
	digamos então que queremos o 
	nome do aluno, nome do curso, se o alunos está ativo ou não
 */
 
select aluno.nome_aluno as 'Nome do Aluno', 
curso.nome_curso as 'Nome do Curso',
aluno.ativo 
from tbl_alunos as aluno
	inner join tbl_cursos as curso
	on aluno.fk_id_curso = curso.id_curso;

/* 
	No exemplo acima nós temos uma forma de
    realizar um inner join que a junção de duas tabelas
    
    outra forma de fazer essa query e desta forma
*/

select aluno.nome_aluno as 'Nome do Aluno', 
curso.nome_curso as 'Nome do Curso',
aluno.ativo 
from tbl_alunos as aluno, tbl_cursos as curso
where aluno.fk_id_curso = curso.id_curso;


/* 
	porém desta forma eu acabo fazendo meu banco
    fazer um teste lógico que sempre vai ser 
    verdadeiro e isso conseme processamento, 
    então a melhor forma é usando inner join 
    pq eu pouco processamento  
*/

# é importante lembrar que para querys maiores é normal o uso de indentaçãoptimize

/*
	outro exemplo de join 
    nome do aluno, nome do curso, numero do telefone, se o alunos está ativo ou não
 */
 
 select alunos.nome_aluno as 'Nome do Aluno',
 curso.nome_curso as 'Nome do Curso',
 telefones.telefone as 'Telefone do Curso',
 alunos.ativo as 'Status'
 from tbl_alunos as alunos
	inner join tbl_cursos as curso
    on alunos.fk_id_curso = curso.id_curso
    inner join tbl_telefone_alunos as telefones
    on alunos.ra_aluno = telefones.fk_id_aluno
where telefones.ativo = 'S'
order by 'Nome do Aluno';
    

 S
 