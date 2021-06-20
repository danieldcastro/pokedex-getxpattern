import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class InformationSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      elevation: 0,
      cornerRadius: 35,
      cornerRadiusOnFullscreen: 0,
      snapSpec: SnapSpec(
        snap: true,
        snappings: [0.65, 1.0],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      body: Center(
        child: Text('This widget is below the SlidingSheet'),
      ),
      builder: (context, state) {
        return Container(
          height: Get.height,
          child: Center(
            child: Text('Counturo'),
          ),
        );
      },
    );
  }
}
