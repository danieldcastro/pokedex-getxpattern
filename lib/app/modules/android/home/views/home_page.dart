import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/model/poke_api.dart';
import '../../../../global/consts/consts_app.dart';

import '../controllers/home_controller.dart';
import 'widgets/appBar_home.dart';

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
                ConstsApp.blackPoke,
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
                      return ListView.builder(
                        itemCount: state.lenght,
                        itemBuilder: (context, index) {
                          final PokeAPI poke = state[index];
                          return ListTile(
                            title: Text(poke.pokemon[index].name),
                            subtitle: Text(poke.pokemon[index].height),
                          );
                        },
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
                              child: Text('Tentar novamente'),
                            )
                          ],
                        ),
                      );
                    }),
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
