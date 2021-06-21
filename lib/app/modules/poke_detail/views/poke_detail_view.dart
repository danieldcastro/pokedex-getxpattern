import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'widgets/page_view_poke.dart';

import '../../../global/consts/consts_app.dart';
import '../controllers/poke_detail_controller.dart';
import 'widgets/information_sheet.dart';

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
                // title: Opacity(
                //     opacity: controller.opacityTitleAppBar.value,
                //     child: Obx(() => Text(
                //           controller.currentPoke(controller.current.value).name,
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 21,
                //           ),
                //         ))),
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
                  Positioned(
                    top: Get.height / 100,
                    left: 20,
                    child: Text(
                      controller.currentPoke(controller.current.value).name,
                      style: TextStyle(
                          fontFamily: 'Google',
                          fontSize: 38 -
                              controller.progress.value * (Get.height * 0.011),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: Get.height / 25 -
                        controller.progress.value * (Get.height * 0.015),
                    child: SizedBox(
                      width: Get.width,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            setTypes(controller
                                .currentPoke(controller.current.value)
                                .type),
                            Text(
                              '#${ConstsApp.parseId(controller.currentPoke(controller.current.value).id)}',
                              style: TextStyle(
                                  fontFamily: 'Google',
                                  fontSize: 26 -
                                      controller.progress.value *
                                          (Get.height * 0.008),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InformationSheet(
                    controller: controller,
                  ),
                  Opacity(
                    opacity: controller.opacity.value,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: (Get.height / 8) -
                              controller.progress.value * 50),
                      child: SizedBox(
                          height: 230,
                          child: PageViewPoke(
                            controller: controller,
                          )),
                    ),
                  ),
                ],
              )),
        ));
  }

  Widget setTypes(List<String> types) {
    List<Widget> lista = [];
    types.forEach((nome) {
      lista.add(
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: Text(
                nome.trim(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        18 - controller.progress.value * (Get.height * 0.005),
                    fontFamily: 'Google'),
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(100, 255, 255, 255),
                  borderRadius: BorderRadius.circular(50)),
            ),
            SizedBox(
              width: 8,
            )
          ],
        ),
      );
    });
    return Row(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
