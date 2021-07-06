import 'package:flutter/material.dart';

import '../../../../data/model/poke_api.dart';
import '../../../../data/model/specie.dart';
import '../../../../global/consts/consts_app.dart';
import '../../controllers/poke_detail_controller.dart';
import 'evolution_card.dart';

class EvolutionTab extends StatelessWidget {
  final PokeDetailController controller;
  final Specie state;
  final List<PokeApi> allPoke;
  final int current;

  EvolutionTab(
      {Key key,
      @required this.controller,
      @required this.state,
      @required this.allPoke,
      @required this.current})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: getEvolution()),
            ],
          ),
        ],
      ),
    );
  }

  Widget evoArrow() {
    return RotatedBox(
      quarterTurns: 1,
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 30,
        color: Colors.black.withOpacity(0.6),
      ),
    );
  }

  List<Widget> getEvolution() {
    PokeApi pokeApi = controller.currentPoke(current);
    List<Widget> _list = [];
    if (pokeApi.prevEvolution != null) {
      pokeApi.prevEvolution.forEach((f) {
        _list.add(EvolutionCard(
            index: int.parse(f.num) - 1,
            controller: controller,
            id: f.num,
            name: f.name,
            color: ConstsApp.getColorType(type: allPoke[current].type[0]),
            image: controller.imagePoke(f.num)));
        _list.add(evoArrow());
      });
    }
    _list.add(EvolutionCard(
        index: current,
        controller: controller,
        id: controller.currentPoke(current).num,
        name: controller.currentPoke(current).name,
        color: ConstsApp.getColorType(type: allPoke[current].type[0]),
        image: controller.imagePoke(controller.currentPoke(current).num)));

    if (pokeApi.nextEvolution != null) {
      _list.add(evoArrow());
      pokeApi.nextEvolution.forEach(
        (f) {
          _list.add(EvolutionCard(
              index: int.parse(f.num) - 1,
              controller: controller,
              id: f.num,
              name: f.name,
              color: ConstsApp.getColorType(type: allPoke[current].type[0]),
              image: controller.imagePoke(f.num)));
          if (pokeApi.nextEvolution.last.name != f.name) {
            _list.add(evoArrow());
          }
        },
      );
    }
    return _list;
  }
}
