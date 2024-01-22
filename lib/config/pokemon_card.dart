import 'package:flutter/material.dart';
import 'package:pokedex_flutter/screens/pokemon_detail_screen.dart';
import 'package:pokedex_flutter/service/pokemon_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    // Crie um mapa de cores para cada tipo de Pokémon
    final Map<String, Color> typeColors = {
      'Grass': Colors.greenAccent,
      'Fire': Colors.redAccent,
      'Water': Colors.blueAccent,
      'Poison': Colors.deepPurpleAccent,
      'Electric': Colors.amber,
      'Rock': Colors.grey,
      'Ground': Colors.brown,
      'Psychic': Colors.indigo,
      'Fighting': Colors.orange,
      'Bug': Colors.lightGreenAccent,
      'Ghost': Colors.deepPurple,
      'Normal': Colors.white70,
      'Others': Colors.pink, // Adicione mais tipos e cores conforme necessário
    };

    // Obtém o tipo do Pokémon
    String pokemonType =
        pokemon.detail.type.isNotEmpty ? pokemon.detail.type[0] : 'Others';

    // Obtém a cor do tipo do Pokémon ou define como branca se não existir no mapa
    Color cardColor = typeColors[pokemonType] ?? Colors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: pokemon.imageUrl,
                  width: 30,
                  height: 30,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
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
              MaterialPageRoute(
                  builder: (context) => PokemonDetailScreen(pokemon: pokemon)),
            );
          },
          child: Card(
            color: cardColor, // Define a cor do card
            child: Column(
              children: <Widget>[
                Center(
                  child: CachedNetworkImage(
                    imageUrl: pokemon.imageUrl,
                    width: 270,
                    height: 250,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
          child: Row(
            children: <Widget>[
              Text('Nome: ${pokemon.name}, ', style: TextStyle(fontSize: 14)),
              Text('Altura: ${pokemon.detail.height}, ',
                  style: TextStyle(fontSize: 14)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PokemonDetailScreen(pokemon: pokemon)),
                  );
                },
                child: Text(
                  'mais...',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
