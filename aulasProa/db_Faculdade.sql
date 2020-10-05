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
    aprovado char(01)
);

# tabela telefones de professores

create table if not exists tbl_telefone_professores(
    fk_id_professor int,
    telefone varchar(11) ,
    ativo enum('S', 'N') not null,
    primary key(fk_id_professor, telefone)
);

# tabela telefones de alunos

create table if not exists tbl_telefone_alunos(
    fk_id_aluno int,
    telefone varchar(11),
	ativo enum('S', 'N') not null,
    primary key(fk_id_aluno, telefone)
);

# tabela disciplinas de professores

create table if not exists tbl_disciplinas_professores(
	fk_id_professor int,
    fk_id_disciplina smallint,
    primary key(fk_id_professor, fk_id_disciplina)
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

# relacionamentos tabela telefones alunos para outras tabelas

alter table tbl_telefone_alunos
add constraint rel_fk_id_pessoa_alunos_tbl_telefone
foreign key(fk_id_aluno)
references tbl_alunos(ra_aluno);

# relacionamentos tabela telefones professores para outras tabelas

alter table tbl_telefone_professores
add constraint rel_fk_id_professores_tbl_telefone
foreign key(fk_id_professor)
references tbl_professores(id_professor);

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

#select * from tbl_disciplinas_professores order by fk_id_professor;
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

# select * from tbl_grades order by fk_id_departamento;
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

# tabela alunos

insert into tbl_alunos(
    nome_aluno,
    sobrenome_aluno,
    cpf_aluno,
    rg_aluno,
    fk_id_curso,
    rua_aluno,
    numero_aluno,
    bairro_aluno,
    ativo
) values (
	"Mario",
    "Cunha de Souza",
    "11111111111",
    "111111111",
    4,
    "Rua Dias de Almeida",
    251,
	"Cidade Julia",
    'S'
), (
	"Roberto",
    "Armando Rodrigues",
    "22222222222",
    "222222222",
    4,
    "Rua Giuliana",
    456,
	"Jardim Miriam",
	'S'
), (
	"Carlos",
    "Tigas de Souza",
    "33333333333",
    "333333333",
    4,
    "Rua Celso Couto",
    555,
    "Pedreira",
    'N'
), (
	"Thiago",
    "Roberto Marinha Dias",
    "44444444444",
    "444444444",
    4,
    "Rua Agusta",
    6984,
    "Centro",
    'N'
), (
	"Caio",
    "Amorim Filho",
	"55555555555",
    "555555555",
    3,
    "Rua Rego Freitas",
    659,
    "Macaé",
    "S"
), (
	"Segio",
    "dos Santos Dias",
	"66666666666",
    "666666666",
    3,
    "Rua Rego Freitas",
    753,
    "Macaé",
    "S"
), (
	"Caio",
    "Amorim Filho",
	"77777777777",
    "777777777",
    3,
    "Aveina Cristianini",
    1069,
    "Jardim Miriam",
    "N"
), (
	"Mario",
    "Buarque de Paula",
	"88888888888",
    "888888888",
    3,
    "Rua Pascoal Valva",
    146,
    "Cidade Julia",
    "N"
), (
	"Douglas",
    "Da Silva Simões",
	"99999999999",
    "999999999",
    2,
    "Avenida Brigadeiro Henrique Pesssoa",
    3098,
    "Vila Zilda",
    "S"
), (
	"Maurício",
    "Dias de Nobrega",
	"21111111111",
    "211111111",
    2,
    "Rua Fernando Henrique Cardoso",
    111,
    "Nova Galvão",
    "S"
), (
	"Samuel",
    "Simões de Paula",
	"12222222222",
    "122222222",
    2,
    "Avinida Cupecê",
    2114,
    "Jardim Miriam",
    "N"
), (
	"Mario",
    "Silva Dias",
	"23333333333",
    "233333333",
    2,
    "Rua Barão de Maua",
    556,
    "Centro",
    "N"
), (
	"Rodrigo",
    "Silva Lima",
	"24444444444",
    "244444444",
    1,
    "Rua da Bica",
    11,
    "Cidade Julia",
    "S"
), (
	"Aldalberto",
    "Caxias de Amorin",
	"26666666666",
    "266666666",
    1,
    "Rua Humberto Eco",
    951,
    "Poá",
    "S"
), (
	"Bruno",
    "Rodrigues Relva",
	"27777777777",
    "277777777",
    1,
    "Rua Roberto Marinho",
    7984,
    "Morumbi",
    "N"
), (
	"Alisson",
    "Galdino Weld",
	"28888888888",
    "288888888",
    1,
    "Avenida Morumbi",
    4985,
    "Morumbi",
    "N"
);

#select * from tbl_alunos;
#select * from tbl_alunos where ativo='S';
#select * from tbl_alunos where ativo='N';
#select * from tbl_alunos where fk_id_curso='1';
#select * from tbl_alunos where fk_id_curso='2';
#select * from tbl_alunos where fk_id_curso='3';
#select * from tbl_alunos where fk_id_curso='4';


# tabelas de turmas 

insert into tbl_turmas(
	fk_id_professor,
	fk_id_disciplina
) values (4,1), 
(3,2), 
(3,3), 
(1,4), 
(5,5), 
(4,6),
(5,7),
(2,8),
(2,9),
(1,10),
(5,11),
(1,12),
(1,13),
(4,14),
(3,15);

# select * from tbl_turmas;

insert into tbl_listas_alunos_turmas(
	fk_id_turma,
    fK_ra_aluno,
    finalizou,
    aprovado
) values (
	12,
    1,
    'N',
	null
), (
	12,
    2,
    'N',
	null
), (
	12,
    3,
    'S',
	'S'
), (
	11,
    1,
    'N',
    null
), (
	11,
    2,
    'N',
    null
), (
	11,
    3,
	'S',
    'S'
), (
	10,
    1,
    'N',
    null
), (
	10,
	2,
	'N',
    null
), (
	6,
    1,
    'N',
    null
), (
	6,
    2,
    'N',
    null
), (
	6,
    3,
    'S',
    'S'
), (
	4,
    1,
    'N',
    null
), (
	4,
    2,
    'N',
    null
), (
	4,
    3,
    'S',
    'S'
), (
	7,
    5,
    'N',
    null
), (
	7,
    6,
	'N',
    null
), (
	3,
    5,
    'N',
    null
), (
	3,
    6,
    'N',
    null
), (
	3,
    7,
    'S',
    'S'
), (
	2,
    5,
    'N',
    null
), (
	2,
    6,
    'N',
    null
), (
	2,
    7,
    'S',
    'S'
), (
	1,
    5,
    'N',
    null
), (
	1,
    6,
    'N',
    null
), (
	1,
    7,
    'S',
    'S'
), (
	2,
    9,
    'N',
	null
), (
	2,
    10,
    'N',
    null
), (
	2,
    11,
    'S',
    'S'
), (
	7,
    9,
    'N',
    null
), (
	7,
    10,
	'N',
    null
), (
	7,
    11,
    'S',
    'S'
), (
	8,
    9,
    'N',
    null
), (
	8,
    10,
    'N',
    null
), (
	8,
    11,
    'S',
    'S'
), (
	9,
    9,
    'N',
    null
), (
	9,
    10,
    'N',
    null
), (
	9,
    11,
    'S',
    'S'
), (
	12,
    13,
    'N',
    null
), (
	12,
    14,
    'N',
    null
), (
	12,
    15,
    'S',
    'S'
), (
	11,
    13,
	'N',
    null
), (
	11,
    14,
    'N',
    null
), (
	11,
    15,
    'S',
    'S'
), (
	10,
    13,
    'N',
    null
), (
	10,
    14,
    'N',
    null
), (
	6,
    13,
	'N',
    null
), (
	6,
    14,
    'N',
    null
), (
	6,
    15,
    'S',
    'S'
), (
	5,
    13,
    'N',
    null
), (
	5,	
    14,
    'N',
    null
), (
	4,
    13,
    'N',
    null
), (
	4,
    14,
    'N',
    null
), (
	4,
    15,
    'S',
    'S'
);

# select * from tbl_listas_alunos_turmas;

# tabela de registros escolares

insert into tbl_registros_escolares(
	fk_ra_aluno,
    fk_id_disciplina_cursada_aluno,
    nota_final_aluno,
    frequencia_aluno,
    data_inicio_disciplina,
    data_fim_disciplina
) values (
	3,
    12,
    8.5,
    70.0,
	'2019-05-26',
	'2019-12-26'
), (
	3,
    11,
    7.2,
    80.0,
	'2019-05-26',
    '2019-12-26'
), (
	3,
    6,
    8.1,
    90.0,
	'2019-05-26',
    '2019-12-26'
), (
	3,
    4,
    7.5,
    100.0,
	'2019-05-26',
    '2019-12-26'
), (
	7,
    3,
    9.0,
    70.0,
	'2019-05-26',
    '2019-12-26'
), (
	7,
    2,
    9.5,
    96.0,
	'2019-05-26',
    '2019-12-26'
), (
	7,
    1,
    8.1,
    68.50,
	'2019-05-26',
    '2019-12-26'
), (
	11,
    8,
    9.9,
    76.35,
	'2019-05-26',
    '2019-12-26'
), (
	11,
    2,
    7.6,
    89.6,
	'2019-05-26',
    '2019-12-26'
), (
	11,
    7,
    8.5,
    100.0,
	'2019-05-26',
    '2019-12-26'
), (
	11,
    9,
    9.0,
    95.0,
	'2019-05-26',
    '2019-12-26'
), (
	15,
    12,
    7.6,
    70.0,
	'2019-05-26',
    '2019-12-26'
), (
	15,
    11,
    9.8,
    78.0,
	'2019-05-26',
    '2019-12-26'
), (
	15,
    6,
    8.0,
    100.0,
	'2019-05-26',
    '2019-12-26'
), (
	15,
    4,
    8.2,
    90.0,
	'2019-05-26',
    '2019-12-26'
);

insert into tbl_telefone_alunos(
    fk_id_aluno,
    telefone,
    ativo
) values (
    1,
    '11911111111',
    'S'
), (
    1,
    '1111111111',
    'N'
), (
    2,
    '1122222222',
    'S'
), (
    3,
    '1133333333',
    'S'
), (
    3,
    '11933333333',
	'S'
), (
    5,
    '11988888888',
    'S'
), (
    5,
    '1188888888',
    'N'
);

insert into tbl_telefone_professores (
    fk_id_professor,
    telefone,
    ativo
) values (
    1,
    '11911111111',
    'S'
), (
    3,
    '1193333333',
    'S'
), (
    3,
    '1133333333',
    'N'
), (
    4,
    '11944444444',
    'S'
), (
	5,
    '1155555555',
    'N'
), (
	5,
    '11955555555',
    'S'
);

/*
select tbl_cursos.nome_curso, 
tbl_departamentos.id_departamento
from tbl_cursos
inner join tbl_departamentos
on tbl_departamentos.id_departamento=tbl_cursos.id_curso;
*/

#drop database db_faculdade;








