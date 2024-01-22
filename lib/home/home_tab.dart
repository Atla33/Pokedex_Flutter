import 'package:flutter/material.dart';
import 'package:pokedex_flutter/config/pokemon_card.dart';
import 'package:pokedex_flutter/service/pokemon_service.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);

  late final PokemonService pokemonService = PokemonService();

  Future<List<Pokemon>> _fetchPokemons() async {
    try {
      return await pokemonService.fetchPokemons();
    } catch (error) {
      throw 'Erro: $error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 40, 40, 1), // AppBar vermelha
        title: const Text(
          'Pokédex',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () {},
          )
        ],
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: _fetchPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro: ${snapshot.error}',
                style: const TextStyle(fontSize: 20),
              ),
            );
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
