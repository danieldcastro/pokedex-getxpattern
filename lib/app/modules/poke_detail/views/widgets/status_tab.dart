import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../global/widgets/global_error.dart';
import '../../../../global/widgets/global_loading_gif.dart';
import '../../controllers/poke_detail_controller.dart';
import '../../controllers/status_tab_controller.dart';

class StatusTab extends GetView<StatusTabController> {
  final PokeDetailController pokeDetailController = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.getPokeInfo();
    return controller.obx(
      (state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      statusText('HP', 0.6, false),
                      statusText('Ataque', 0.6, false),
                      statusText('Defesa', 0.6, false),
                      statusText('Ataque Esp.', 0.6, false),
                      statusText('Defesa Esp.', 0.6, false),
                      statusText('Velocidade', 0.6, false),
                      statusText('Total', 0.6, false),
                    ],
                  ),
                  Column(
                    children: [
                      statusText(
                          controller.getPokeStatus()[0].toString(), 1, true),
                      statusText(
                          controller.getPokeStatus()[1].toString(), 1, true),
                      statusText(
                          controller.getPokeStatus()[2].toString(), 1, true),
                      statusText(
                          controller.getPokeStatus()[3].toString(), 1, true),
                      statusText(
                          controller.getPokeStatus()[4].toString(), 1, true),
                      statusText(
                          controller.getPokeStatus()[5].toString(), 1, true),
                      statusText(
                          controller.getPokeStatus()[6].toString(), 1, true),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 7),
                      statusLine(controller.getPokeStatus()[0] / 160),
                      statusLine(controller.getPokeStatus()[1] / 160),
                      statusLine(controller.getPokeStatus()[2] / 160),
                      statusLine(controller.getPokeStatus()[3] / 160),
                      statusLine(controller.getPokeStatus()[4] / 160),
                      statusLine(controller.getPokeStatus()[5] / 160),
                      statusLine(controller.getPokeStatus()[6] / 680),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              infoTitle('Fraquezas'),
              SizedBox(
                height: 10,
              ),
              infoDesc(
                pokeDetailController
                    .currentPoke(pokeDetailController.current.value)
                    .weaknesses
                    .toString()
                    .replaceAll('[', '')
                    .replaceAll(']', ''),
              ),
              SizedBox(
                height: 20,
              ),
              infoTitle('Formas'),
              SizedBox(
                height: 10,
              ),
              infoDesc(
                controller.listPokeForm(),
              ),
              SizedBox(
                height: 20,
              ),
              infoTitle('Habilidades'),
              SizedBox(
                height: 10,
              ),
              infoDesc(
                controller.listPokeAbility(),
              ),
              SizedBox(
                height: 20,
              ),
              infoTitle('Movimentos'),
              SizedBox(
                height: 10,
              ),
              infoDesc(
                controller.listPokeMove(),
              ),
            ],
          ),
        );
      },
      onLoading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 200),
          GlobalLoadingGif(),
        ],
      ),
      onError: (error) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          GlobalError(reload: controller.getPokeInfo(), error: error),
        ],
      ),
    );
  }

  Widget statusText(String title, double opacity, bool bold) {
    bool isBold = bold;
    return Column(
      children: [
        SizedBox(height: 15),
        Text(
          title,
          style: TextStyle(
              fontSize: 17,
              fontFamily: 'Google',
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.black.withOpacity(opacity)),
        ),
      ],
    );
  }

  Widget infoTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 19, fontFamily: 'Google', fontWeight: FontWeight.bold),
    );
  }

  Widget infoDesc(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 17,
          fontFamily: 'Google',
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.6)),
    );
  }

  Widget statusLine(double widthFactor) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 4,
          width: Get.width * 0.52,
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: FractionallySizedBox(
            widthFactor: widthFactor,
            heightFactor: 1,
            child: Container(
              decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: widthFactor > 0.5 ? Colors.teal : Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
