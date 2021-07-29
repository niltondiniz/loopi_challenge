# Desafio desenvolvimento mobile

## Documentação do desafio realizado

O aplicativo foi desenvolvido em Flutter na versão stable 2.2.3,
todos os pacotes necessários ao projeto estão nas dependêndicas (pubspec.yaml).

## Pacotes utilizados

### Dependencies
1.  equatable: ^2.0.3 - Comparador de objetos, usado para facilitar ordenacoes de listas e nos testes unitarios
2.  http: ^0.13.3 - Cliente http
3.  dartz:  0.10.0-nullsafety.2 - Plugin utilizado para incluir programação funcional, usado neste projeto, para integrar o Triple (padrão de gerencia de estados)
4.  flutter_modular: ^3.3.1  - Facilitador para trabalhar com rotas nomeadas, injeção de dependência entre outras.
5.  triple: ^1.2.0+1 - Padrão para gerência de estado (Dart)
6.  flutter_triple: ^1.2.3+1 - Implementação do padrão para gerência de estado
7.  cached_network_image: ^3.1.0 - Cacheador de imagens para economizar banda larga do dispositivo

### Dev-Dependencies
1.  mocktail: ^0.1.4 - Mocker usando muito nos testes unitários.... O que seria dos testes sem ele (kkk)
2.  flutter_launcher_icons: "^0.9.1" - Package facilitador na hora de gerar icone do app
3.  flutter_native_splash: ^1.2.0 - Package facilitador para gerar splashscreen

## Api

A api utilizada foi a proposta no desafio, se encontra em https://www.themoviedb.org/



## Passos para executar a aplicação

1. Faça um clone do repositório
2. rode o comando flutter pub get no terminal (na raiz da aplicação)
3. Escolha seu emulador ou device
4. Pressione F5

## Como utilizar

O aplicativo aplicativo possui 4 telas

1. SplashScreen, apresenta o logotipo da Loopi
2. Lista de filmes populares da api TheMoviedb
3. Filtro de Gêneros, com 2 tipos de filtragem, o filtro rápido, que basta pressionar o gênero selecionado que o filtro já é realizado, e o filtro multipla escolha.
4. Tela de Detalhes do filme, com todos os recursos solicitados na descricao do desafio.

## Arquitetura utilizada no App

O app foi construido sob clean architecture, usando o padrão proposto e muito difundido na comunidade de desenvolvedores que utiliza clean arch, dispondo o app em camadas. Além da estrutura do app utilizar clean architecture, foi utilizado o padrão Triple (https://triple.flutterando.com.br/docs/getting-started/what-is-triple) para gerência de estados.

Todo o app esta coberto por testes unitarios, foi usado o conceito TDD em todo o app para garantir que todos os recursos do app estejam em pleno funcionamento, e diminuindo a possibilidade de falhas.

Foram respeitas as sugestões clean code para organização de código.

## Recursos

Os seguinte recursos estão presentes no App
* Cache de Imagem
* Testes unitários
* A lista de filmes possui paginação dos dados obtidos, carregando de 20 em 20 filmes (Respeitando os gêneros selecionados)
* Gerenciamento de Estados com otimização de renderização de tela, prevenindo a perda de estado ao mudar a orientação da tela

## Observações Gerais

Devido aos compromissos que já possuia na semana do desafio precisei de mais prazo para desenvolvimento do mesmo, busquei me esforçar ao máximo para manter um prazo razoável. A idéia proposta no desafio foi muito interessante ao ponto que eu mudei minha apresentação (Na Radix) para usar a ideia do app de filmes, a diferença que o app da apresentação foi desenvolvido em 2 horas devido a baixa complexidade, se propunha a listar os dados da api somente em uma ListView, e mostrar na tela de detalhes, já o app do desafio foi desenvolvido com base em todo critério de um app profissional com padrão de qualidade de código, ampla cobertura de testes unitários, baixo acoplamento, organização de código, limitações arquiteturais positivas respeitando os principios de OO.

