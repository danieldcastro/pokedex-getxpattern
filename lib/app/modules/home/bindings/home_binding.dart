import 'package:get/get.dart';

import '../../../data/provider/poke_api_provider.dart';
import '../../../data/repository/poke_api_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
    Get.lazyPut<PokeApiRepository>(
        () => PokeApiRepository(pokeApiProvider: PokeApiProvider()));
  }
}
