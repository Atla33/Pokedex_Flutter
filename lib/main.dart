import 'package:flutter/material.dart';
import 'package:pokedex_flutter/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:pokedex_flutter/store/pokemon_store.dart';

void main() {
  runApp(
    Provider<PokemonStore>(
      create: (_) => PokemonStore(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
