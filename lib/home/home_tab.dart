import 'package:flutter/material.dart';
import 'package:pokedex_flutter/config/pokemon_card.dart';
import 'package:pokedex_flutter/service/pokemon_service.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  final PokemonService pokemonService = PokemonService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text.rich(TextSpan(
          style: TextStyle(fontSize: 30),
          children: [
            TextSpan(text: 'Pokedex', style: TextStyle(color: Colors.white)),
          ]
        )),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          )
        ],
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: pokemonService.fetchPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                return PokemonCard(pokemon: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}
