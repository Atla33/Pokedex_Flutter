import 'package:flutter/material.dart';
import 'package:pokedex_flutter/base/home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          //parte de cima cor vermelha
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text.rich(TextSpan(
                  text: 'Pokédex',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
              ],

          )),

          //parte de baixo cor branca
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20), 
              decoration: const BoxDecoration (
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Center( // Centraliza o botão
                      child: SizedBox(
                        height: 60,
                        width: 300, 
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BaseScreen(),
                              ),
                            );
                          }, 
                          child: const Text('Iniciar', style: TextStyle(color: Colors.white)), // Cor do texto
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, 
                          ),
                        ),
                      ),
                    ),
                  ),
                ],

              ),
            ),
          ),
        ],
      )
    );
  }
}
