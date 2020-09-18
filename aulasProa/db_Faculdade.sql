create database if not exists db_faculdade;

use db_faculdade;

# tabela alunos

create table if not exists tbl_alunos(
	ra_aluno int auto_increment primary key,
    nome_aluno varchar(20) not null,
    sobrenome_aluno varchar(60) not null,
    cpf_aluno varchar(11) not null unique,
    rg_aluno varchar(09) not null unique,
    fk_id_curso smallint not null,
    rua_aluno varchar(50) not null,
    numero_aluno smallint not null,
    bairro_aluno varchar(50) not null,
    ativo char(1) not null
);

# tabela professores

create table if not exists tbl_professores(
	id_professor int auto_increment primary key,
	nome_professor  varchar(20) not null,
	sobrenome_professor varchar(60) not null,
	cpf_professor varchar(11) not null unique,
	rg_professor varchar(09) not null unique,
	rua_professor varchar(50) not null,
	numero_professor smallint not null,
	bairro_professor varchar(50) not null
);

# tabela turmas

create table if not exists tbl_turmas(
	id_turma smallint auto_increment primary key,
	fk_id_disciplina smallint not null,
	fk_id_professor int not null
);

# tabela disciplinas

create table if not exists tbl_disciplinas(
	id_disciplina smallint auto_increment primary key,
	nome_disciplina varchar(50) not null
);

# tabela grades 

create table if not exists tbl_grades(
	fk_id_disciplina smallint not null,
	fk_id_departamento smallint not null,
	obrigatoria char(1) not null
);

# tabela departamentos

create table if not exists tbl_departamentos(
	id_departamento smallint auto_increment primary key,
    fk_id_professor_vinculado int not null unique,
    nome_departamento varchar(40) not null
);

# tabela cursos

create table if not exists tbl_cursos(
	id_curso smallint auto_increment primary key,
    fk_id_departamento smallint not null,
    nome_curso varchar(40) not null
);

# tabela registros escolares 

create table if not exists tbl_registros_escolares(
	fk_ra_aluno int not null,
    fk_id_disciplina_cursada_aluno smallint not null,
    nota_final_aluno float not null,
    frequencia_aluno float not null,
    data_inicio_disciplina date not null,
    data_fim_disciplina date not null
);

# tabela listas alunos turmas 

create table if not exists tbl_listas_alunos_turmas(
	fk_id_turma smallint not null,
    fk_ra_aluno int not null,
    finalizou char(01) not null,
    aprovado char(01) not null
);

# tabela telefones 

create table if not exists tbl_telefone(
	fk_id_tipo_pessoa tinyint not null,
    fk_id_pessoa int not null,
    telefone_pessoa varchar(11) not null
);

# tabela tipo pessoa 

create table if not exists tbl_tipo_pessoa(
	id_tipo_pessoa tinyint auto_increment primary key,
    nome_tipo_pessoa varchar(30) not null
);

# tabela disciplinas de professores

create table if not exists tbl_disciplinas_professores(
	fk_id_professor int not null,
    fk_id_disciplina smallint not null
);

# criando relacionamentos entre as tabelas 

# relacionamentos tabela alunos para outras tabelas
 
alter table tbl_alunos 
add constraint rel_fk_id_curso_tbl_alunos
foreign key(fk_id_curso)
references tbl_cursos(id_curso);

# relacionamentos tabela cursos para outras tabelas

alter table tbl_cursos
add constraint rel_fk_id_departamento_tbl_cursos
foreign key(fk_id_departamento)
references tbl_departamentos(id_departamento);

# relacionamentos tabela departamento para outras tabelas

alter table tbl_departamentos
add constraint rel_fk_id_professor_vinculado_tbl_departamentos
foreign key(fk_id_professor_vinculado)
references tbl_professores(id_professor); 

# relacionamentos tabela disciplinas professores para outras tabelas 

alter table tbl_disciplinas_professores
add constraint rel_fk_id_professor_tbl_disciplinas_professores
foreign key(fk_id_professor)
references tbl_professores(id_professor);

alter table tbl_disciplinas_professores
add constraint rel_fk_id_disciplina_tbl_disciplinas_professores
foreign key(fk_id_disciplina)
references tbl_disciplinas(id_disciplina);

# relacionamentos tabela grades para outra tabelas 

alter table tbl_grades
add constraint rel_fk_id_disciplinas_tbl_grades
foreign key(fk_id_disciplina)
references tbl_disciplinas(id_disciplina);

alter table tbl_grades
add constraint rel_fk_id_departamento_tbl_grades
foreign key(fk_id_departamento)
references tbl_departamentos(id_departamento);

# relacionamentos tabela turma para outras tabelas

alter table tbl_turmas
add constraint rel_fk_id_disciplina_tbl_turma
foreign key(fk_id_disciplina)
references tbl_disciplinas(id_disciplina);

alter table tbl_turmas
add constraint rel_fk_id_professor_tbl_turma
foreign key(fk_id_professor)
references tbl_professores(id_professor);

# relacionamentos tabela lista alunos da turma para outra tabelas

alter table tbl_listas_alunos_turmas
add constraint rel_fk_id_turma_tbl_listas_alunos_turmas
foreign key(fk_id_turma)
references tbl_turmas(id_turma);

alter table tbl_listas_alunos_turmas 
add constraint rel_fk_ra_aluno_tbl_listas_alunos_turmas
foreign key(fk_ra_aluno)
references tbl_alunos(ra_aluno);

# relacionamentos tabela registros escolares para outras tabelas

alter table tbl_registros_escolares
add constraint rel_fk_ra_aluno_tbl_registros_escolares
foreign key(fk_ra_aluno)
references tbl_alunos(ra_aluno);

alter table tbl_registros_escolares
add constraint rel_fk_id_disciplina_registros_escolares
foreign key(fk_id_disciplina_cursada_aluno)
references tbl_disciplinas(id_disciplina);

# relacionamentos tabela telefones para outras tabelas

alter table tbl_telefone
add constraint rel_fk_id_pessoa_alunos_tbl_telefone
foreign key(fk_id_pessoa)
references tbl_alunos(ra_aluno);

alter table tbl_telefone
add constraint rel_fk_id_professores_tbl_telefone
foreign key(fk_id_pessoa)
references tbl_professores(id_professor);

alter table tbl_telefone
add constraint rel_fk_id_tipo_pessoa_tbl_telefone
foreign key(fk_id_tipo_pessoa)
references tbl_tipo_pessoa(id_tipo_pessoa);

# inserindo dados dentro da tabela

# tabela disciplinas

insert into tbl_disciplinas(
	nome_disciplina
) values (
    "Arquitetura Sustentável"
), (
    "Resistencia dos Materiais"
), (
    "História Geral da Arte"
), ( 
    "Lógica de Programação e Algoritmos"
), (
    "Redes de Computadores"
), (
    "Qualidade de Software"
), ( 
	"Teoria das Estruturas"
), (
	"Mecânica dos Solos e Fundações"
), (
	"Materiais de Construção Civil"
), (
    "Inteligência Artificial"
), (
    "Técnicas de Programação"
), (
    "Modelagem de Dados"
), (
	"Liderança – Atributos e Atribuições"
), (
    "Economia e Gestão do Setor Público"
), (
    "Processos Organizacionais"
); 

# select * from tbl_disciplinas;

# tabela professores 

insert into tbl_professores(
	nome_professor,
    sobrenome_professor,
    cpf_professor,
    rg_professor,
    rua_professor,
    numero_professor,
    bairro_professor
) values (
	'Carlos',
    'Alberto de Nobrega',
    '11111111111',
    '111111111',
    'Rua Dias de Almeida',
	123,
    'Jardim Miriam'
), (
	'Mario',
    'Souza Braga',
    '22222222222',
    '222222222',
    'Rua Giuliana',
	111,
    'Cidade Julia'
), (
	'Thomas',
    'Silva Souza Chagas',
    '33333333333',
    '333333333',
    'Rua da Idenpendência',
	1110,
    'Pedreira'
), (
	'Maria',
    'Reina de Olivera',
    '44444444444',
    '444444444',
    'Rua da Abolição',
	1597,
    'Jardim Fontalis'
), (
	'Rosileine',
    'Chagas de Fatima',
    '55555555555',
    '555555555',
    'Av Cupece',
	3588,
    'Centro'
);

# select * from tbl_professores

# tabela disciplinas professores 

insert into tbl_disciplinas_professores(
	fk_id_professor,
    fk_id_disciplina
) values (
	1,
    12
), (
	1, 
    10
), (
	1,
    4
), (
	2,
    9
), (
    2,
    8
), (
	3,
    3
), (
	3,
    2
), (
	4,
    6
), (
	4, 
    1
), (
	4,
    2
), (
   5,
   5
), (
   5,
   7
), (
   5,
   11
), (
   1,
   13
), (
   4,
   14
), (
   3,
   15
);

select * from tbl_disciplinas_professores;
#select * from tbl_disciplinas_professores where fk_id_professor=1;
#select * from tbl_disciplinas_professores where fk_id_professor=2;
#select * from tbl_disciplinas_professores where fk_id_professor=3;
#select * from tbl_disciplinas_professores where fk_id_professor=4;
#select * from tbl_disciplinas_professores where fk_id_professor=5;
#select count(*) from tbl_disciplinas_professores where fk_id_professor=1;
#select count(*) from tbl_disciplinas_professores where fk_id_professor=2;
#select count(*) from tbl_disciplinas_professores where fk_id_professor=3;
#select count(*) from tbl_disciplinas_professores where fk_id_professor=4;
#select count(*) from tbl_disciplinas_professores where fk_id_professor=5;

# tabela de departamentos

insert into tbl_departamentos(
	fk_id_professor_vinculado,
    nome_departamento
) values (
	1,
    "Daparatmento de Ciência da Computação"
), (
	2,
    "Departamento de Engenharia Cívil"
), (
	3,
    "Departamento de Ciência Arquitetônica"
), (
	5, 
    "Depertamento de Engenharia de Software"
);

#select * from tbl_departamentos;

# tabela de cursos

insert into tbl_cursos(
	fk_id_departamento,
    nome_curso
) values (
	1,
    "Ciência da Computação"
), (
	2,
    "Engenharia Cívil"
), (
	3,
    "Arquitetura"
), (
	4,
	"Engenharia de Software"
);

# select * from tbl_cursos;

# tabela de grades 

insert into tbl_grades(
	fk_id_disciplina,
    fk_id_departamento,
    obrigatoria
) values (
	4,
    1,
    'S'
), (
	5,
    1,
    'N'
), (
	6,
    1,
    'S'
), (
	10,
    1,
    'N'
), (
	11,
    1,
    'S' 
), (
	12,
    1,
    'S'
), (
	9,
    2,
    'S'
), (
	8,
    2,
    'S'
), (
	7,
    2,
    'S'
), (
    2,
    2,
	'S'
), (
	1,
    3,
    'S'
), (
	2,
    3,
    'S'
), (
	3,
	3,
    'S'
), (
	7,
    3,
    'N'
), (
	4,
    4,
    'S'
), (
	6,
    4,
    'S'
), (
	10,
    4,
    'N'
), (
	11,
    4,
    'S'
), (
	12,
    4,
    'S'
);

# select * from tbl_grades;
# select * from tbl_grades where fk_id_departamento=1
# select * from tbl_grades where fk_id_departamento=2
# select * from tbl_grades where fk_id_departamento=3
# select * from tbl_grades where fk_id_departamento=4
# select * from tbl_grades where fk_id_departamento=1 and obrigatoria='S';
# select * from tbl_grades where fk_id_departamento=2 and obrigatoria='S';
# select * from tbl_grades where fk_id_departamento=3 and obrigatoria='S';
# select * from tbl_grades where fk_id_departamento=4 and obrigatoria='S';
# select * from tbl_grades where fk_id_departamento=1 and obrigatoria='N';
# select * from tbl_grades where fk_id_departamento=2 and obrigatoria='N';
# select * from tbl_grades where fk_id_departamento=3 and obrigatoria='N';
# select * from tbl_grades where fk_id_departamento=4 and obrigatoria='N';
 
 
# drop database db_faculdade;






