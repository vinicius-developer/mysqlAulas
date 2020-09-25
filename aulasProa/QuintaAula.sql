
use db_Desafio2;

/* Select em mais de uma tabela*/

select historico.fk_mat, alunos.nome 
from alunos 
inner join historico 
on historico.fk_mat = alunos.mat;


select historico.fk_mat as mat, 
alunos.nome as nome_aluno, 
historico.fk_cod_disc as codigo_disciplina, 
disciplinas.nome_disc as nome_disciplina,
disciplinas.carga_hor as carga_horaria
from disciplinas 
inner join historico 
on disciplinas.cod_disc=historico.fk_cod_disc 
inner join alunos
on alunos.mat=historico.fk_mat
order by carga_hor;

select historico.fk_mat as numero_matricula,
alunos.nome as nome_aluno,
alunos.cidade as cidade_aluno,
alunos.endereco as endereco_aluno,
historico.fk_cod_prof as codigo_professor,
professores.nome as nome_professor,
professores.endereco as endereco_professor,
historico.fk_cod_disc as codigo_desciplina,
disciplinas.nome_disc as nome_disciplina,
disciplinas.carga_hor as carga_horaria
from disciplinas 
inner join historico
on disciplinas.cod_disc=historico.fk_cod_disc
inner join alunos
on alunos.mat=historico.fk_mat
inner join professores
on professores.cod_prof=historico.fk_cod_prof
where carga_hor <= 50
order by nome_aluno;


select historico.fk_mat as numero_matricula,
alunos.nome as nome_aluno,
alunos.cidade as cidade_aluno,
alunos.endereco as endereco_aluno,
historico.fk_cod_prof as codigo_professor,
professores.nome as nome_professor,
professores.endereco as endereco_professor,
historico.fk_cod_disc as codigo_desciplina,
disciplinas.nome_disc as nome_disciplina,
disciplinas.carga_hor as carga_horaria,
historico.nota as nota_aluno,
historico.nota + 0.5 as "Nota com 0.5 pontos a mais"
from disciplinas 
inner join historico
on disciplinas.cod_disc=historico.fk_cod_disc
inner join alunos
on alunos.mat=historico.fk_mat
inner join professores
on professores.cod_prof=historico.fk_cod_prof
where disciplinas.carga_hor <= 50 
and historico.nota <= 5 
order by nome_aluno;

/* 
para fazer essa tipo de pesquisa é necessário referenciar em algum momento as 
4 tabelas uma pelo from e outras pelo inner join
*/


/* da tabela de turma - criar uma consulta que exiba o codigo do professor,
o nome do professor, o código da turma, o código da disciplina , o nome 
da disciplina e o horario */

# tabela turma = | código professor | nome professor | codigo turma | código desciplina | nome desciplina | horario

select turma.cod_prof as "Código Professor",
professores.nome as "Nome Professor",
turma.cod_turma as "Código da Turma",
turma.cod_disc as "Código da Disciplina",
disciplinas.nome_disc as "Nome da Desciplina",
turma.horario as "Horário Aula",
professores.endereco as "Endereco professor"
from turma 
inner join professores
on professores.cod_prof = turma.cod_prof
inner join disciplinas
on disciplinas.cod_disc = turma.cod_disc;

# Silvia Fiacador]

SELECT brinquedo.nome, operador.nome 
from brinquedo, operador, agenda
where brinquedo.codbrinq = agenda.codbrinq 
and operador.codoper = agenda.codoper 
and agenda.turno = 'Manhã';








