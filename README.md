# controle_licenca

Autoria de Christian santos

A todos da comunidade que quiserem ajudar no código, serão bem vindo

## Getting Started

--------------
Para instalação

Banco de dados usado Mysql

dentro da pasta util.ignore tem o SQL para importar no mysql
tem tambem or aquivos php para usar paa conexão com API.
Foi usado o xampp, a pasta deve ser colocada dentro de 
C:\xampp\htdocs\
em conexão, coloque as credenciais do seu banco de dados.

importante:

No banco de dados as colunas de válidação são :

chave: Coluna responsavel pela chave de ativação 
uso: Coluna responsavel por informar se a chave de ativação foi usada ou não, 0 -> não foi usada, 1 -> já foi usada
tempo: Tempo em meses que a licença vale, 1 -> 1 mês, 2 -> meses, até 12 meses(MAX)
data_criação: data de criação da chave
data_ativacao: data de ativação da chave



OBS: a colune nome, é FOREING KEY da tabela usuário, só não foi vincula para manter integridade.


---------------------
