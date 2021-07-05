import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../data/model/poke_api.dart';
import '../../../data/model/specie.dart';
import '../../../data/repository/poke_api_repository.dart';
import '../../../global/consts/consts_app.dart';

class PokeDetailController extends GetxController
    with StateMixin, SingleGetTickerProviderMixin {
  final PokeApiRepository _pokeApiRepository;

  TabController tabController;
  List arg = Get.arguments;
  PageController pageController;
  PageController aboutPageController;
  final current = 0.obs;
  final currentInfo = 0.obs;
  List<PokeApi> allPoke;
  RxDouble progress = 0.0.obs;
  RxDouble opacity = 1.0.obs;
  RxDouble opacityTitleAppBar = 0.0.obs;

  double _multiple;
  MultiTrackTween _animation;

  PokeDetailController(this._pokeApiRepository);

  @override
  onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    initialPoke();
    pageController =
        PageController(initialPage: current.value, viewportFraction: 0.49);
    aboutPageController = PageController(initialPage: 0);
    allPoke = arg[0];
    rotationPoke();
    // getPokeInfo();
    getPokeSpecie();
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

  String getPokePhase() {
    PokeApi _poke = allPoke[current.value];
    String _pokePhase;

    if (_poke.prevEvolution == null) {
      _pokePhase = 'Pokémon Básico';
    } else if (_poke.nextEvolution == null) {
      _pokePhase = 'Pokémon Estágio 2';
    } else {
      _pokePhase = 'Pokémon Estágio 1';
    }
    return _pokePhase;
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
    opacityTitleAppBar.value = interval(0.6, 0.87, progress.value);
  }

  Future getPokeSpecie() async {
    change([], status: RxStatus.loading());
    try {
      final data = await _pokeApiRepository
          .getPokeSpecie(allPoke[current.value].id.toString());
      //await _pokeApiRepository.getPokeInfo(allPoke[current.value].name);
      change(data, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Deu ruim! Bora tentar mais uma vez?'));
    }
  }

  String getPokeDescription(state) {
    String _description = state.flavorTextEntries[6].flavorText;
    _description = _description
        .replaceAll('\n', ' ')
        .replaceAll('\f', ' ')
        .replaceAll('POKéMON', 'Pokémon');
    return _description;
  }

  String eggGroupParse(List<EvolvesFromSpecies> state) {
    List eggGroup = [];
    for (int i = 0; i < state.length; i++) {
      eggGroup.add(
        state[i].name[0].toUpperCase() + state[i].name.substring(1),
      );
    }
    return eggGroup.toString().replaceAll('[', '').replaceAll(']', '');
  }

  Widget imagePoke(index) {
    return SizedBox(
      height: 80,
      child: CachedNetworkImage(
        placeholder: (context, url) => new Container(
          color: Colors.transparent,
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.transparent,
        ),
        imageUrl: '${ConstsApp.IMG_URL}$index.png',
      ),
    );
  }
}
