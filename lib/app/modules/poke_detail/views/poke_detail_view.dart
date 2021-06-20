import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

import '../../../global/consts/consts_app.dart';
import 'widgets/information_sheet.dart';

import '../controllers/poke_detail_controller.dart';

class PokeDetailView extends GetView<PokeDetailController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedTheme(
          data: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: controller.getColor(controller.current.value),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              scaffoldBackgroundColor:
                  controller.getColor(controller.current.value)),
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Opacity(
                    opacity: 0,
                    child: Obx(() => Text(
                          controller.currentPoke(controller.current.value).name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ))),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () => Get.back(),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border_rounded,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              body: Stack(
                children: [
                  Container(
                    height: Get.height / 3,
                  ),
                  InformationSheet(),
                  Padding(
                    padding: EdgeInsets.only(top: Get.height / 8),
                    child: SizedBox(
                        height: 230,
                        child: Obx(() => CarouselSlider.builder(
                              options: CarouselOptions(
                                viewportFraction: 0.49,
                                onPageChanged: (index, reason) =>
                                    controller.changePage(index),
                                initialPage: controller.current.value,
                                scrollPhysics: BouncingScrollPhysics(),
                                enableInfiniteScroll: false,
                                enlargeCenterPage: true,
                              ),
                              itemCount: controller.allPoke.length,
                              itemBuilder: (context, index, pageViewIndex) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ControlledAnimation(
                                      playback: Playback.LOOP,
                                      duration:
                                          controller.rotationPoke().duration,
                                      tween: controller.rotationPoke(),
                                      builder: (buildContext, animatedValue) =>
                                          Transform.rotate(
                                        angle: animatedValue['rotation'],
                                        child: Hero(
                                          tag: index.toString(),
                                          child: AnimatedOpacity(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                            opacity: index ==
                                                    controller.current.value
                                                ? 0.3
                                                : 0,
                                            child: Image.asset(
                                              ConstsApp.BLACK_POKE,
                                              color: Colors.white,
                                              height: 270,
                                              width: 270,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    AnimatedPadding(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                      padding: EdgeInsets.all(
                                          index == controller.current.value
                                              ? 0
                                              : 50),
                                      child: CachedNetworkImage(
                                        color: index == controller.current.value
                                            ? null
                                            : Colors.black.withOpacity(0.3),
                                        height: 180,
                                        width: 180,
                                        errorWidget: (context, url, error) =>
                                            Container(
                                                color: Colors.transparent),
                                        imageUrl: controller.getImage(index),
                                        placeholder: (context, url) =>
                                            Container(
                                                color: Colors.transparent),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ))),
                  ),
                ],
              )),
        ));
  }
}
