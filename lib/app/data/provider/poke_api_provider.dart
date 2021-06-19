import 'package:get/get.dart';

import '../../global/consts/consts_api.dart';
import '../model/poke_api.dart';

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
}
