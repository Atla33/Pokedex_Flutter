import 'package:dio/dio.dart';
import 'dart:convert';

class Evolution {
  final String num;
  final String name;

  Evolution({required this.num, required this.name});

  factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(
      num: json['num'],
      name: json['name'],
    );
  }
}

class PokemonDetail {
  final String height;
  final String weight;
  final String spawnTime;
  final List<String> weaknesses;
  final List<Evolution> prevEvolution;
  final List<Evolution> nextEvolution;
  final List<String> type;

  PokemonDetail({
    required this.height,
    required this.weight,
    required this.spawnTime,
    required this.weaknesses,
    required this.prevEvolution,
    required this.nextEvolution,
    required this.type,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
      height: json['height'],
      weight: json['weight'],
      spawnTime: json['spawn_time'],
      weaknesses: List<String>.from(json['weaknesses']),
      prevEvolution: json['prev_evolution'] != null
          ? (json['prev_evolution'] as List)
              .map((e) => Evolution.fromJson(e))
              .toList()
          : [],
      nextEvolution: json['next_evolution'] != null
          ? (json['next_evolution'] as List)
              .map((e) => Evolution.fromJson(e))
              .toList()
          : [],
      type: List<String>.from(json['type']),
    );
  }
}

class Pokemon {
  final String name;
  final String imageUrl;
  PokemonDetail detail;

  Pokemon({required this.name, this.imageUrl = '', required this.detail});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      imageUrl: json['img'],
      detail: PokemonDetail.fromJson(json),
    );
  }
}

class PokemonService {
  final Dio _dio = Dio();

  Future<List<Pokemon>> fetchPokemons() async {
    final response = await _dio.get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.data);
      List<dynamic> pokemonsJson = data['pokemon'];
      List<Pokemon> pokemons =
          pokemonsJson.map((json) => Pokemon.fromJson(json)).toList();
      return pokemons;
    } else {
      throw Exception('Erro ao buscar dados do Pokémon.');
    }
  }
}
