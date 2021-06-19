import 'package:get/get.dart';

import '../../global/consts/consts_api.dart';
import '../model/poke_api.dart';

class PokeApiProvider extends GetConnect {
  // Future<List<PokeApi>> getAll() async {
  //   final response = await get<List<PokeApi>>(ConstsApi.pokeapiURL, decoder: (body) {
  //     if (body is List) {
  //       return body.map<PokeApi>((resp) => PokeApi.fromJson(resp)).toList();
  //     }
  //     return null;
  //   });
  //   print(response.body);
  //   if (response.hasError) {
  //     throw Exception('Erro ao buscar Pokémon');
  //   }

  //   return response.body;
  // }

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
