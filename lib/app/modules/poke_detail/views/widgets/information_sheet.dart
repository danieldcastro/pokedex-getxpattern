import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../global/widgets/global_error.dart';
import '../../../../global/widgets/global_loading_gif.dart';

import '../../controllers/poke_detail_controller.dart';
import 'about_poke.dart';

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
          child: controller.obx(
            (state) {
              return AboutPoke(
                  controller: controller,
                  allPoke: controller.allPoke,
                  current: controller.current.value,
                  state: state);
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
                GlobalError(reload: controller.getPokeSpecie(), error: error),
              ],
            ),
          ),
        );
      },
    );
  }
}
