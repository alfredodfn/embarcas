# README

* Versão do Ruby

Ruby 2.7.0 com Rails 5.2.6.

* Informações

Esse sistema utiliza o ElasticSearch par efetuar buscas. Ele está configurado no docker-compose.yml.

Os dados são armazenados em um banco de dados relacional, o PostgreSQL.

* Configuração

Primeiramente faça o download do repositório:

```
git clone https://github.com/alfredodfn/embarcas.git
```

Após, execute o comando: 

```
docker compose up
```

* Criar base de dados

Para criar a base de dados, ainda com o container em execução, execute o comando:

```
docker-compose run web rake db:create db:migrate
```

* Inicializar base de dados

Para popular a base com os dados iniciais, com o container em execução, execute: 

```
docker-compose run web rake db:seed
```

* ElasticSearch

Antes de executar a aplicação, é necessário reindexar os dados após popular a base: 

```
docker-compose run web rake searchkick:reindex:all
```

* Acessar a aplicação

Para acesssar a aplicação basta digitar `http://localhost:3000` no navegador web.

* How to run the test suite

Para executar os testes digite: 

```
docker-compose run web rspec
```

