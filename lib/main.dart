import 'package:flutter/material.dart';
import 'package:pokedex_flutter/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.white.withAlpha(190)
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
