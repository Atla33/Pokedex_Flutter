import 'package:flutter/material.dart';
import 'package:pokedex_flutter/base/home_base.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, // Fundo branco
        body: Column(
          children: [
            //parte de cima cor vermelha
            Expanded(
              flex:
                  2, // Aumenta o tamanho da parte superior para dar mais espaço para a imagem e o texto
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Image.asset('assets/pokeball.png'), // Imagem de fundo
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/Pikachu.webp',
                          height:
                              150), // Aumenta o tamanho da imagem do Pikachu
                      const SizedBox(height: 20), // Espaço abaixo da imagem
                      const Text.rich(
                        TextSpan(
                          text: 'Pokédex',
                          style: TextStyle(
                            fontSize:
                                50, // Aumenta o tamanho da fonte para destacar mais o texto
                            fontWeight: FontWeight.bold,
                            color:
                                Colors.black, // Cor do texto "Pokédex" de preto
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //parte de baixo cor branca
            Expanded(
              flex:
                  1, // Reduz o tamanho da parte inferior para dar mais espaço para a parte superior
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(
                      255, 215, 40, 40), // Vermelho mais claro meio opaco
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Center(
                        // Centraliza o botão
                        child: SizedBox(
                          height: 60,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BaseScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Iniciar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue[
                                            900]!), // Cor do botão que combine
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
