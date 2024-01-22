import 'package:flutter/material.dart';
import 'package:pokedex_flutter/home/home_tab.dart';
import 'package:pokedex_flutter/store/pokemon_store.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final pageController = PageController();
  final pokemonStore = PokemonStore(); // Cria uma instância de PokemonStore

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeTab(pokemonStore: pokemonStore), // Passa a instância para HomeTab
        ],
      ),
      // FloatingActionButton removido
    );
  }
}
