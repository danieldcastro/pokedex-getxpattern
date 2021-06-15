import 'package:get/get.dart';

import '../../../../data/repository/poke_api_repository.dart';

class HomeController extends GetxController with StateMixin {
  final PokeApiRepository _pokeApiRepository;

  HomeController(this._pokeApiRepository);

  @override
  void onInit() {
    super.onInit();
    getAllPoke();
  }

  Future getAllPoke() async {
    change([], status: RxStatus.loading());

    try {
      final data = await _pokeApiRepository.getAll();
      change(data, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar Pokémon'));
    }
  }
}
