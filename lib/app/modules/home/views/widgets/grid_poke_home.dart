import 'package:flutter/material.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../data/model/poke_api.dart';
import '../../../../global/consts/consts_app.dart';
import '../../../../routes/app_routes.dart';
import 'poke_card.dart';

class GridPokeHome extends StatelessWidget {
  final List<PokeApi> state;
  final Widget card;

  const GridPokeHome({
    Key key,
    @required this.state,
    this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        physics: BouncingScrollPhysics(), //Efeito elástico ao puxar a lista
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
        addAutomaticKeepAlives: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.35),
        itemCount: state.length,
        itemBuilder: (context, index) {
          final PokeApi poke = state[index];
          List arg = [state, poke];
          return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: 2,
              duration: Duration(milliseconds: 375),
              child: ScaleAnimation(
                child: GestureDetector(
                  onTap: () => Get.toNamed(
                    Routes.POKE_DETAIL,
                    arguments: arg,
                  ),
                  child: PokeCard(
                      id: ConstsApp.parseId(poke.id),
                      image:
                          '${ConstsApp.IMG_URL}${ConstsApp.parseId(poke.id)}.png',
                      name: poke.name,
                      type: poke.type,
                      color: ConstsApp.getColorType(type: poke.type[0]),
                      index: index),
                ),
              ));
        },
      ),
    );
  }
}
