import 'package:flutter/material.dart';

import '../provider/poke_api_provider.dart';

class PokeApiRepository {
  final PokeApiProvider pokeApiProvider;

  PokeApiRepository({@required this.pokeApiProvider});

  getAll() async {
    return pokeApiProvider.getAll();
  }
}
