import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global/consts/consts_app.dart';
import '../controllers/home_controller.dart';
import 'widgets/appBar_home.dart';
import 'widgets/grid_poke_home.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = Get.mediaQuery.padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: statusBarHeight - 240 / 2.9,
            left: Get.width - (240 / 1.6),
            child: Opacity(
              child: Image.asset(
                ConstsApp.BLACK_POKE,
                height: 240,
                width: 240,
              ),
              opacity: 0.1,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusBarHeight,
                ),
                AppBarHome(
                  menuTap: () {},
                ),
                Expanded(
                  child: Container(
                    child: controller.obx((state) {
                      return GridPokeHome(
                        state: state,
                      );
                    }, onError: (error) {
                      return SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(error),
                            TextButton(
                              onPressed: () => controller.getAllPoke(),
                              child: Text(
                                'Tentar novamente',
                                style: TextStyle(
                                    color: Get.context.theme.primaryColor),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                        onLoading: Center(
                          child: CircularProgressIndicator(
                            color: Get.context.theme.primaryColor,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
