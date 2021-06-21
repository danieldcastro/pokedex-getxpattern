import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

import '../../../data/model/poke_api.dart';
import '../../../global/consts/consts_app.dart';

class PokeDetailController extends GetxController {
  List arg = Get.arguments;
  PageController pageController;
  final current = 0.obs;
  List<PokeApi> allPoke;
  RxDouble progress = 0.0.obs;
  RxDouble opacity = 1.0.obs;
  // RxDouble opacityTitleAppBar = 0.0.obs;

  double _multiple;
  MultiTrackTween _animation;

  @override
  onInit() {
    super.onInit();
    initialPoke();
    pageController =
        PageController(initialPage: current.value, viewportFraction: 0.49);
    allPoke = arg[0];
    rotationPoke();
    _multiple = 1;
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

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  listenerSlidingSheet(state) {
    progress.value = state.progress;
    _multiple = 1 - interval(0.2, 0.5, progress.value);
    opacity.value = _multiple;
    // opacityTitleAppBar.value = interval(0.6, 0.87, progress.value);
  }
}
