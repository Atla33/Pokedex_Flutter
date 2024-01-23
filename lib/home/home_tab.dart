import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_flutter/config/pokemon_card.dart';
import 'package:pokedex_flutter/store/pokemon_store.dart';

class HomeTab extends StatelessWidget {
  final PokemonStore pokemonStore;

  const HomeTab({Key? key, required this.pokemonStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 40, 40, 1),
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
      body: Observer(
        builder: (_) {
          switch (pokemonStore.pokemonsFuture.status) {
            case FutureStatus.pending:
              return const Center(child: CircularProgressIndicator());
            case FutureStatus.rejected:
              return Center(
                child: Text(
                  'Erro: ${pokemonStore.pokemonsFuture.error}',
                  style: const TextStyle(fontSize: 20),
                ),
              );
            case FutureStatus.fulfilled:
              return ListView.builder(
                itemCount: pokemonStore.pokemonsFuture.result.length,
                itemBuilder: (_, index) {
                  return PokemonCard(
                      pokemon: pokemonStore.pokemonsFuture.result[index]);
                },
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
