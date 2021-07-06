import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import '../../../global/consts/consts_app.dart';
import '../controllers/poke_detail_controller.dart';
import 'widgets/information_sheet.dart';
import 'widgets/page_view_poke.dart';

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
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () => Get.back(),
                ),
              ),
              body: Stack(
                children: [
                  Positioned(
                    top: Get.height / 100,
                    child: SizedBox(
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Get.width * 0.7,
                              child: AutoSizeText(
                                controller
                                    .currentPoke(controller.current.value)
                                    .name,
                                maxLines: 1,
                                style: TextStyle(
                                    fontFamily: 'Google',
                                    fontSize: 40 -
                                        controller.progress.value *
                                            (Get.height * 0.011),
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              '#${ConstsApp.parseId(controller.currentPoke(controller.current.value).id)}',
                              style: TextStyle(
                                  fontFamily: 'Google',
                                  fontSize: 22 -
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
                  Positioned(
                    top: Get.height / 25 -
                        controller.progress.value * (Get.height * 0.015),
                    child: SizedBox(
                      width: Get.width,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            setTypes(controller
                                .currentPoke(controller.current.value)
                                .type),
                            Text(
                              controller.getPokePhase() != null
                                  ? controller.getPokePhase()
                                  : '',
                              style: TextStyle(
                                  fontFamily: 'Google',
                                  fontSize: 18 -
                                      controller.progress.value *
                                          (Get.height * 0.005),
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InformationSheet(controller: controller),
                  Opacity(
                    opacity: controller.opacity.value,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: controller.opacityTitleAppBar.value == 1
                              ? 1000
                              : (Get.height / 8) -
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
