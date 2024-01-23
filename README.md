# Projeto App Pokémon

Este projeto é um aplicativo desenvolvido em Flutter que simula o feed de uma rede social. O aplicativo consome a API de Pokémons e exibe os posts em formato de cards. Ao clicar em um post específico, uma tela de detalhes é exibida.

## Tecnologias Utilizadas
O projeto foi desenvolvido utilizando as seguintes tecnologias:

- dio: ^5.4.0: Uma poderosa biblioteca Dart Http que suporta Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout, etc.
- mobx: ^2.3.0+1 e flutter_mobx: ^2.2.0+2: Utilizados para gerenciamento de estado.
- cached_network_image: ^3.3.1: Uma biblioteca para mostrar imagens da internet e manter um cache delas.
- provider: ^6.1.1: Um wrapper em torno do InheritedWidget para tornar seu uso mais fácil e intuitivo.
- build_runner: ^2.4.8 e mobx_codegen: ^2.6.0+1: Utilizados para geração de código.

# Funcionalidades

O aplicativo apresenta um feed de posts, cada um representando um Pokémon. Cada post é exibido como um card contendo informações do Pokémon. Ao clicar em um card, o usuário é levado a uma tela de detalhes onde pode ver mais informações sobre o Pokémon selecionado.

Este projeto é uma excelente demonstração do poder e da flexibilidade do Flutter e das bibliotecas mencionadas. Esperamos que você goste!

# API Utilizada

A [API de Pokémons](https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json) é utilizada neste projeto. Ela fornece dados sobre diferentes Pokémons que são consumidos pelo aplicativo para exibir informações relevantes aos usuários. A API é acessada através de requisições HTTP, que são gerenciadas pela biblioteca Dio no Flutter. As respostas da API são então processadas e utilizadas para preencher os posts e detalhes exibidos no aplicativo.

# Como Executar

- 1º Clone o repositório: Primeiro, você precisa clonar o repositório do GitHub para a sua máquina local. Você pode fazer isso usando o comando git clone seguido da URL do repositório. Por exemplo:
git clone https://github.com/Atla33/Pokedex_Flutter.git
- 2º Navegue até o diretório do projeto: Use o comando cd para navegar até o diretório do projeto que você acabou de clonar. Por exemplo:
cd Pokedex_Flutter
- 3º Instale as dependências: O Flutter usa o pub para gerenciar pacotes. Você pode instalar as dependências do projeto executando o seguinte comando no diretório do projeto:
flutter pub get
- 4º Execute o aplicativo: Agora você pode executar o aplicativo Flutter em um emulador ou em um dispositivo físico conectado. Use o seguinte comando para iniciar o aplicativo:
flutter run ou precione F5

Lembre-se de ter o Flutter e o Dart corretamente instalados em sua máquina e um dispositivo (emulador ou físico) pronto para executar o aplicativo.

![image](https://github.com/Atla33/Pokedex_Flutter/assets/92339449/273d10b8-0539-49a2-be3a-d0d75a7af401)![image](https://github.com/Atla33/Pokedex_Flutter/assets/92339449/261f9624-b80e-444f-a33c-9066540f7a7e)
![image](https://github.com/Atla33/Pokedex_Flutter/assets/92339449/5f646242-2d6b-49df-9334-fe56074af027)



