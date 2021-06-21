import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../controllers/poke_detail_controller.dart';

class InformationSheet extends StatelessWidget {
  final PokeDetailController controller;

  const InformationSheet({Key key, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      listener: (state) => controller.listenerSlidingSheet(state),
      elevation: 0,
      cornerRadius: 35,
      snapSpec: SnapSpec(
        snap: true,
        // onSnap: (state, snap) {
        //   print(state.isExpanded);
        // },
        snappings: [0.65, 0.89],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      builder: (context, state) {
        return Container(
          height: Get.height,
          //  child: Align(
          //    alignment: Alignment.topCenter,
          //    child: TextButton(child: Text('botao'), onPressed: () => print('apertado'),)),
        );
      },
    );
  }
}
