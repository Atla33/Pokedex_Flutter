// pokemon_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/service/pokemon_service.dart';
import 'package:pokedex_flutter/store/pokemon_store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PokemonDetailScreen extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final pokemonStore = Provider.of<PokemonStore>(context);
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

    return Scaffold(
      backgroundColor: cardColor,
      appBar: AppBar(
        backgroundColor: cardColor,
        title: Text(
          "Pokedex",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Observer(
            builder: (_) => IconButton(
              icon: Icon(
                pokemonStore.isLiked ? Icons.favorite : Icons.favorite_border,
                color: pokemonStore.isLiked ? Colors.red : null,
              ),
              onPressed: () {
                pokemonStore.toggleLikeStatus();
              },
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (pokemonStore.loadingState == "loading") {
            return Center(child: CircularProgressIndicator());
          } else if (pokemonStore.loadingState == "completed") {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.pokemon.name,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      pokemonType,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Image.network(
                      widget.pokemon.imageUrl,
                      fit: BoxFit.cover,
                      height: 350,
                      width: 350,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Nome: ${widget.pokemon.name}',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text('Altura: ${widget.pokemon.detail.height}',
                              style: TextStyle(fontSize: 20)),
                          SizedBox(height: 10),
                          Text('Peso: ${widget.pokemon.detail.weight}',
                              style: TextStyle(fontSize: 20)),
                          SizedBox(height: 10),
                          Text(
                              'Hora de Desova: ${widget.pokemon.detail.spawnTime}',
                              style: TextStyle(fontSize: 20)),
                          SizedBox(height: 10),
                          Text(
                              'Fraquezas: ${widget.pokemon.detail.weaknesses.join(', ')}',
                              style: TextStyle(fontSize: 20)),
                          SizedBox(height: 10),
                          Text(
                              'Pré-evolução: ${widget.pokemon.detail.prevEvolution.map((e) => e.name).join(', ')}',
                              style: TextStyle(fontSize: 20)),
                          SizedBox(height: 10),
                          Text(
                              'Próxima evolução: ${widget.pokemon.detail.nextEvolution.map((e) => e.name).join(', ')}',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (pokemonStore.loadingState == "error") {
            return Center(
                child: Text(
                    "Ocorreu um erro ao carregar os detalhes do Pokémon."));
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
