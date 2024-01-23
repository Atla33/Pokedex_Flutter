// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonStore on _PokemonStore, Store {
  late final _$pokemonsFutureAtom =
      Atom(name: '_PokemonStore.pokemonsFuture', context: context);

  @override
  ObservableFuture<List<Pokemon>> get pokemonsFuture {
    _$pokemonsFutureAtom.reportRead();
    return super.pokemonsFuture;
  }

  @override
  set pokemonsFuture(ObservableFuture<List<Pokemon>> value) {
    _$pokemonsFutureAtom.reportWrite(value, super.pokemonsFuture, () {
      super.pokemonsFuture = value;
    });
  }

  late final _$pokemonsAtom =
      Atom(name: '_PokemonStore.pokemons', context: context);

  @override
  ObservableList<Pokemon> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<Pokemon> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$loadingStateAtom =
      Atom(name: '_PokemonStore.loadingState', context: context);

  @override
  String get loadingState {
    _$loadingStateAtom.reportRead();
    return super.loadingState;
  }

  @override
  set loadingState(String value) {
    _$loadingStateAtom.reportWrite(value, super.loadingState, () {
      super.loadingState = value;
    });
  }

  late final _$isLikedAtom =
      Atom(name: '_PokemonStore.isLiked', context: context);

  @override
  bool get isLiked {
    _$isLikedAtom.reportRead();
    return super.isLiked;
  }

  @override
  set isLiked(bool value) {
    _$isLikedAtom.reportWrite(value, super.isLiked, () {
      super.isLiked = value;
    });
  }

  late final _$fetchPokemonsAsyncAction =
      AsyncAction('_PokemonStore.fetchPokemons', context: context);

  @override
  Future<dynamic> fetchPokemons() {
    return _$fetchPokemonsAsyncAction.run(() => super.fetchPokemons());
  }

  late final _$_PokemonStoreActionController =
      ActionController(name: '_PokemonStore', context: context);

  @override
  void addPokemon(Pokemon pokemon) {
    final _$actionInfo = _$_PokemonStoreActionController.startAction(
        name: '_PokemonStore.addPokemon');
    try {
      return super.addPokemon(pokemon);
    } finally {
      _$_PokemonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleLikeStatus() {
    final _$actionInfo = _$_PokemonStoreActionController.startAction(
        name: '_PokemonStore.toggleLikeStatus');
    try {
      return super.toggleLikeStatus();
    } finally {
      _$_PokemonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonsFuture: ${pokemonsFuture},
pokemons: ${pokemons},
loadingState: ${loadingState},
isLiked: ${isLiked}
    ''';
  }
}
