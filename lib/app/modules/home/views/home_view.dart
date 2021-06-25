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
              opacity: 0.03,
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
                            Image.asset(
                              'assets/images/egg.png',
                              height: 100,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              error,
                              style: TextStyle(
                                  fontFamily: 'Google',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                            SizedBox(height: 50,),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        )),
                        backgroundColor: MaterialStateProperty.all(context.theme.primaryColor),
                      ),
                              onPressed: () => controller.getAllPoke(),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30),
                                child: Text(
                                  'Bora',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Google',
                                      fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                        onLoading: Center(
                            child: Image.asset('assets/gifs/gif_poke.gif',
                                height: 150))),
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
