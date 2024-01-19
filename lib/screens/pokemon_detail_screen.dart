import 'package:flutter/material.dart';
import 'package:pokedex_flutter/service/pokemon_service.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: 300,
                child: Image.network(
                  pokemon.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white, // Define a cor branca
                  borderRadius: BorderRadius.circular(12.0), // Define bordas arredondadas
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0), // Adiciona espaçamento entre os textos
                      child: Text(
                        'Nome: ${pokemon.name}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Altura: ${pokemon.detail.height}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Peso: ${pokemon.detail.weight}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Hora de Desova: ${pokemon.detail.spawnTime}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Fraquezas: ${pokemon.detail.weaknesses.join(', ')}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Pré-evolução: ${pokemon.detail.prevEvolution.map((e) => e.name).join(', ')}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Text(
                      'Próxima evolução: ${pokemon.detail.nextEvolution.map((e) => e.name).join(', ')}',
                      style: TextStyle(fontSize: 20),
                    ),
                    // Adicione mais detalhes aqui
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
