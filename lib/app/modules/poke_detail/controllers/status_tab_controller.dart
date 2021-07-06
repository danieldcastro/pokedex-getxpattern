import 'package:get/get.dart';

import '../../../data/provider/poke_api_provider.dart';
import '../../../data/repository/poke_api_repository.dart';
import 'poke_detail_controller.dart';

class StatusTabController extends GetxController with StateMixin {
  PokeDetailController pokeDetailController = Get.find();

  final PokeApiRepository _pokeApiRepository =
      PokeApiRepository(pokeApiProvider: PokeApiProvider());

  onInit() {
    super.onInit();
    getPokeInfo();
  }

  getPokeInfo() {
    change([], status: RxStatus.loading());
    _pokeApiRepository
        .getPokeInfo(pokeDetailController
            .allPoke[pokeDetailController.current.value].name)
        .then((data) {
      change(data, status: RxStatus.success());
    }, onError: (e) {
      print(e);
      change([], status: RxStatus.error('Deu ruim! Bora tentar mais uma vez?'));
    });
  }

  List<int> getPokeStatus() {
    List<int> list = [1, 2, 3, 4, 5, 6, 7];
    int sum = 0;
    state.stats.forEach((f) {
      sum = sum + f.baseStat;
      switch (f.stat.name) {
        case 'hp':
          list[0] = f.baseStat;
          break;
        case 'attack':
          list[1] = f.baseStat;
          break;
        case 'defense':
          list[2] = f.baseStat;
          break;
        case 'special-attack':
          list[3] = f.baseStat;
          break;
        case 'special-defense':
          list[4] = f.baseStat;
          break;
        case 'speed':
          list[5] = f.baseStat;
          break;
      }
    });
    list[6] = sum;
    return list;
  }

  String listPokeAbility() {
    List _list = [];
    String abilities = '';

    state.abilities.forEach((element) {
      _list.add(element.ability.name[0].toUpperCase() +
          element.ability.name.substring(1));
    });

    abilities = _list.toString().replaceAll('[', '').replaceAll(']', '');
    return abilities;
  }

  String listPokeForm() {
    List _list = [];
    String forms = '';

    state.forms.forEach((element) {
      _list.add(element.name[0].toUpperCase() + element.name.substring(1));
    });

    forms = _list.toString().replaceAll('[', '').replaceAll(']', '');
    return forms;
  }

  String listPokeMove() {
    List _list = [];
    String moves = '';

    state.moves.forEach((element) {
      _list.add(
          element.move.name[0].toUpperCase() + element.move.name.substring(1));
    });

    moves = _list.toString().replaceAll('[', '').replaceAll(']', '');
    return moves;
  }
}
