import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

import '../../../global/consts/consts_app.dart';

import '../../../data/model/poke_api.dart';

class PokeDetailController extends GetxController {
  List arg = Get.arguments;
  PageController pageController;
  final current = 0.obs;
  List<PokeApi> allPoke;

  MultiTrackTween _animation;

  @override
  onInit() {
    super.onInit();
    initialPoke();
    pageController = PageController(initialPage: current.value);
    allPoke = arg[0];
    rotationPoke();
  }

  int initialPoke() {
    PokeApi _currentPoke = arg[1];
    List<PokeApi> _allPoke = arg[0];
    for (int i = 0; i < _allPoke.length; i++) {
      if (_currentPoke.id == _allPoke[i].id) {
        current.value = i;
      }
    }
    return current.value;
  }

  changePage(int index) {
    current.value = index;
  }

  PokeApi currentPoke(currentIndex) {
    List<PokeApi> _allPoke = arg[0];
    PokeApi currentPoke = _allPoke[currentIndex];
    return currentPoke;
  }

  Color getColor(currentIndex) {
    Color color =
        ConstsApp.getColorType(type: currentPoke(currentIndex).type[0]);
    return color;
  }

  String getImage(int index) {
    String img =
        '${ConstsApp.IMG_URL}${ConstsApp.parseId(allPoke[index].id)}.png';
    return img;
  }

  MultiTrackTween rotationPoke() {
    _animation = MultiTrackTween([
      Track('rotation').add(Duration(seconds: 2), Tween(begin: 0.0, end: 3.15),
          curve: Curves.linear)
    ]);
    return _animation;
  }
}
