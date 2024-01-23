import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex_flutter/Store/pokemon_store.dart';
import 'package:pokedex_flutter/screens/pokemon_detail_screen.dart';
import 'package:pokedex_flutter/service/pokemon_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;

  PokemonCard({required this.pokemon});

  @override
  _PokemonCardState createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  final PokemonStore pokemonStore = PokemonStore();

  @override
  Widget build(BuildContext context) {
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
      'Others': Colors.pink,
    };

    String pokemonType = widget.pokemon.detail.type.isNotEmpty
        ? widget.pokemon.detail.type[0]
        : 'Others';

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
                  imageUrl: widget.pokemon.imageUrl,
                  width: 30,
                  height: 30,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Text(
              widget.pokemon.name,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PokemonDetailScreen(pokemon: widget.pokemon)),
            );
          },
          child: Card(
            color: cardColor,
            child: Column(
              children: <Widget>[
                Center(
                  child: CachedNetworkImage(
                    imageUrl: widget.pokemon.imageUrl,
                    width: 270,
                    height: 250,
                    fit: BoxFit.contain,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Observer(
              builder: (_) => IconButton(
                icon: Icon(
                  pokemonStore.isLiked ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: pokemonStore.toggleLikeStatus,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.comment),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Curtido por esigsoftware e outras 13,616 pessoas',
            style: TextStyle(fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Text('Nome: ${widget.pokemon.name}, ',
                  style: const TextStyle(fontSize: 14)),
              Text('Altura: ${widget.pokemon.detail.height}, ',
                  style: const TextStyle(fontSize: 14)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PokemonDetailScreen(pokemon: widget.pokemon)),
                  );
                },
                child: const Text(
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
