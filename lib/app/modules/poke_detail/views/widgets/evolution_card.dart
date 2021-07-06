import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import '../../../../global/consts/consts_app.dart';
import '../../controllers/poke_detail_controller.dart';

class EvolutionCard extends StatelessWidget {
  final String name;
  final Color color;
  final Widget image;
  final String id;
  final PokeDetailController controller;
  final int index;

  const EvolutionCard(
      {Key key,
      @required this.name,
      @required this.color,
      @required this.image,
      @required this.id,
      @required this.controller,
      @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return SizedBox(
        height: 115,
        child: GestureDetector(
          onTap: () => controller.pageController.jumpToPage(index),
          child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: color,
              elevation: 0,
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: -15,
                    right: -15,
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        ConstsApp.BLACK_POKE,
                        color: Get.theme.backgroundColor,
                        height: 95,
                        width: 95,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: image,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: cons.maxWidth * .55,
                              child: AutoSizeText(
                                name,
                                maxLines: 2,
                                wrapWords: false,
                                maxFontSize: 22,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Opacity(
                            opacity: 0.6,
                            child: Text('#$id',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white)))
                      ],
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }
}
