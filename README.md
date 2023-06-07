# Gameplay App

GameplayApp é um aplicativo para criação de grupos gamers. Dentro do app é possível criar grupos para jogar seus games favoritos com os amigos.O aplicativo conta com diversas modalidades de partidas, por exemplo: Ranqueada, Duelo 1x1, Casual, etc…

Você poderá adicionar qual será o servidor do discord, data e hora e uma descrição da jogatina com os seus amigos. Todos os jogadores com o acesso a esses servidores do discord automaticamente terão acesso a esse compromisso e poderão participar.

## Tecnologias usadas

O Aplicativo desenvolvido em Flutter e se comunicará com o backend por meio de um API Restful, desenvolvida em NodeJS na sua versão mais recente (LTS) utilizando a biblioteca ExpressJS e salvando as informações de Login em uma base de dados MySQL.

### Mobile

- Dependencias
  - Flutter: 3.0
  - Google Fonts: 4.0.4
  - Flutter Native Splash: 2.3.0
  - http: 0.13.6
  - Webview Flutter: 4.2.1

---

### Backend

- Dependencias
  - Express: 4.18.2
  - Express Session: 1.17.3
  - Passport: 0.6.0
  - Passport-discord: 0.1.4
  - DotEnv: 16.1.4
  - EsLint: 8.42.0
  - Nodemon: 2.0.22

---

## Objetivo

Em suma, o projeto GameplayApp busca atender à demanda crescente por uma plataforma que facilite a organização de jogatinas entre amigos na comunidade gamer. Com uma abordagem estratégica, parcerias potenciais e uma implementação técnica sólida, esperamos oferecer aos usuários uma experiência única e satisfatória, proporcionando momentos de diversão e conexão por meio dos jogos.

## Instalação do projeto

- Visual Studio Code
- Android Studio
- Flutter
- Git
- Node
- MySQL

1. Instalar a SDK do flutter:

   - Faça o download do Flutter SDK em

     [Download Flutter SDK](https://flutter.dev/docs/get-started/install).

   - Extrair o arquivo zip em uma pasta se for windows é recomendado dentro do **_C:_**

   - Adicionar a pasta **_C:\flutter\bin_** nas suas variáveis de ambiente.

   - Eventuais dúvidas consultar a documentação oficial do flutter.

2. Clonagem o projeto:

   - Abrir o terminal do seu sistema
   - Vá até a pasta onde deseja clonar o projeto
   - Execute o seguindo comando para clonar o projeto:

     `git clone <url_do_projeto>`

   - Depois de executar o **_git clone_** entre no diretório onde o projeto se encontra.

3. Instalando as dependências:

   - Dentro do projeto, execute o seguinte comando para obter as depêndencias:
     `flutter pub get`

4. Executando o projeto:

   - Conecte um dispositivo físico ou inicie um emulador Android/iOS.

   - No terminal, execute o seguinte comando para verificar se o Flutter reconhece seu dispositivo/emulador:

     `flutter devices`

   - Em seguida digite:
     `flutter run`

Pronto! O projeto vai compilar e iniciar o aplicativo!

### Links

[Front-end Mobile](https://github.com/victoraaquino/gamplay-app-uninove)

[Back-end](https://github.com/Arthurlimadev/techtok-backend)
