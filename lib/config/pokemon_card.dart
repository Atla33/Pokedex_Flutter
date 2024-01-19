import 'package:flutter/material.dart';
import 'package:pokedex_flutter/screens/pokemon_detail_screen.dart';
import 'package:pokedex_flutter/service/pokemon_service.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.network(pokemon.imageUrl, width: 30, height: 30),
              ),
            ),
            Text(
              pokemon.name,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PokemonDetailScreen(pokemon: pokemon)),
            );
          },
          child: Card(
            child: Column(
              children: <Widget>[
                Center(
                  child: Image.network(
                    pokemon.imageUrl,
                    width: 270,  // Ajuste o tamanho conforme necessário
                    height: 250, // Ajuste o tamanho conforme necessário
                    fit: BoxFit.contain, // Utiliza BoxFit.contain para evitar cortes
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.comment),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Curtido por esigsoftware e outras 13,616 pessoas',
            style: TextStyle(fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row( // Adiciona um widget Row
            children: <Widget>[
              Text('Nome: ${pokemon.name}, ', style: TextStyle(fontSize: 14)), // Aumenta o tamanho do texto
              Text('Altura: ${pokemon.detail.height}, ', style: TextStyle(fontSize: 14)), // Aumenta o tamanho do texto
              GestureDetector( // Adiciona um GestureDetector para o texto "mais..."
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PokemonDetailScreen(pokemon: pokemon)),
                  );
                },
                child: Text(
                  'mais...',
                  style: TextStyle(color: Colors.blue, fontSize: 14), // Faz o texto parecer um link e aumenta o tamanho do texto
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
