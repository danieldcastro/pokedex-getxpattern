import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../../global/consts/consts_app.dart';
import '../../controllers/poke_detail_controller.dart';

class PageViewPoke extends StatelessWidget {
  final PokeDetailController controller;

  const PageViewPoke({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      physics: BouncingScrollPhysics(),
      itemCount: controller.allPoke.length,
      onPageChanged: (index) => controller.changePage(index),
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            ControlledAnimation(
              playback: Playback.LOOP,
              duration: controller.rotationPoke().duration,
              tween: controller.rotationPoke(),
              builder: (buildContext, animatedValue) => Transform.rotate(
                angle: animatedValue['rotation'],
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  opacity: index == controller.current.value ? 0.3 : 0,
                  child: Image.asset(
                    ConstsApp.BLACK_POKE,
                    color: Colors.white,
                    height: 270,
                    width: 270,
                  ),
                ),
              ),
            ),
            AnimatedPadding(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding:
                  EdgeInsets.all(index == controller.current.value ? 0 : 60),
              child: Hero(
                tag: index == controller.current.value
                    ? ConstsApp.parseId(controller.allPoke[index].id)
                    : 'none' + index.toString(),
                child: CachedNetworkImage(
                  color: index == controller.current.value
                      ? null
                      : Colors.black.withOpacity(0.3),
                  height: 180,
                  width: 180,
                  errorWidget: (context, url, error) =>
                      Container(color: Colors.transparent),
                  imageUrl: controller.getImage(index),
                  placeholder: (context, url) =>
                      Container(color: Colors.transparent),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
