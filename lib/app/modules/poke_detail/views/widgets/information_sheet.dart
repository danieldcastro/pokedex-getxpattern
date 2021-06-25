import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokedex/app/modules/about_poke/views/about_poke_view.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../controllers/poke_detail_controller.dart';

class InformationSheet extends StatelessWidget {
  final PokeDetailController controller;

  const InformationSheet({Key key, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      scrollSpec: ScrollSpec(physics: BouncingScrollPhysics()),
      listener: (state) => controller.listenerSlidingSheet(state),
      elevation: 0,
      color: Get.theme.backgroundColor,
      cornerRadius: 35,
      snapSpec: SnapSpec(
        snap: true,
        snappings: [0.65, 0.89],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      builder: (context, state) {
        return Container(
          height: Get.height - Get.height * 0.12,
         child: AboutPokeView(
           allPoke: controller.allPoke,
           current: controller.current.value,
         ),
        );
      },
    );
  }
}
