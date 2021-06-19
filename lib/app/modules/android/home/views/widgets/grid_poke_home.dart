import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../data/model/poke_api.dart';
import '../../controllers/home_controller.dart';
import 'poke_card.dart';

class GridPokeHome extends StatelessWidget {
  final List<PokeApi> state;
  final Function cardTap;
  final HomeController controller;

  const GridPokeHome(
      {Key key,
      @required this.state,
      @required this.cardTap,
      @required this.controller})
      : super(key: key);

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
          return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: 2,
              duration: Duration(milliseconds: 375),
              child: ScaleAnimation(
                child: GestureDetector(
                  onTap: cardTap,
                  child: PokeCard(
                    id: controller.parseId(poke.id),
                    image: poke.img,
                    name: poke.name,
                    type: poke.type,
                  ),
                ),
              ));
        },
      ),
    );
  }
}
