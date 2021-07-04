import 'package:get/get.dart';

import '../../global/consts/consts_api.dart';
import '../model/poke_api.dart';
import '../model/poke_api_v2.dart';
import '../model/specie.dart';

class PokeApiProvider extends GetConnect {
  Future<List<PokeApi>> getAll() async {
    List<PokeApi> pokemon = <PokeApi>[];
    final response =
        await get<List<PokeApi>>(ConstsApi.POKE_API_URL, decoder: (body) {
      pokemon = pokeApiFromJson(body);
      return pokemon;
    });

    if (response.hasError) {
      throw Exception('Erro ao buscar Pokémon');
    }
    return pokemon;
  }

  Future<PokeApiV2> getPokeInfo(String name) async {
    PokeApiV2 pokeInfo = PokeApiV2();
    final response = await get<PokeApiV2>(
        '${ConstsApi.POKE_API_V2_URL}${name.toLowerCase()}', decoder: (body) {
      pokeInfo = pokeApiV2FromJson(body);
      return pokeInfo;
    });
    if (response.hasError) {
      throw Exception('Erro ao buscar informações');
    }
    return pokeInfo;
  }

  Future<Specie> getPokeSpecie(String numPokemon) async {
    Specie pokeSpecie = Specie();
    final response = await get<Specie>(
        '${ConstsApi.POKE_API_SPECIE_URL}$numPokemon', decoder: (body) {
      pokeSpecie = specieFromJson(body);
      return pokeSpecie;
    });
    if (response.hasError) {
      throw Exception('Erro ao buscar informações');
    }
    return pokeSpecie;
  }
}
