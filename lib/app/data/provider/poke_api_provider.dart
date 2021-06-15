import 'package:get/get.dart';

import '../../global/consts/consts_api.dart';
import '../model/poke_api.dart';

class PokeApiProvider extends GetConnect {
  Future<List<PokeAPI>> getAll() async {
    final response = await get(ConstsApi.pokeapiURL, decoder: (body) {
      return body.map<PokeAPI>((resp) => PokeAPI.fromJson(resp)).to ?? [];
    });
    if (response.hasError) {
      throw Exception('Erro ao buscar Pokémon');
    }
    return response.body;
  }
}
