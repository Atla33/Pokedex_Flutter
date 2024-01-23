// pokemon_store.dart
import 'package:mobx/mobx.dart';
import 'package:pokedex_flutter/service/pokemon_service.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStore with _$PokemonStore;

abstract class _PokemonStore with Store {
  final PokemonService pokemonService = PokemonService();

  @observable
  ObservableFuture<List<Pokemon>> pokemonsFuture = ObservableFuture.value([]);

  @observable
  String loadingState = "idle";

  @observable
  bool isLiked = false;

  _PokemonStore() {
    fetchPokemons();
  }

  @action
  Future fetchPokemons() async {
    loadingState = "loading";
    try {
      pokemonsFuture = ObservableFuture(pokemonService.fetchPokemons());
      await pokemonsFuture;
      loadingState = "completed";
    } catch (e) {
      loadingState = "error";
    }
  }

  @action
  void toggleLikeStatus() {
    isLiked = !isLiked;
  }
}
