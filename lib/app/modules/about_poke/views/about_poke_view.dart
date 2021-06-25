import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pokedex/app/data/model/poke_api.dart';
import 'package:pokedex/app/global/consts/consts_app.dart';

import '../controllers/about_poke_controller.dart';

class AboutPokeView extends StatelessWidget {
  final List<PokeApi> allPoke;
  final int current;

  const AboutPokeView({Key key, @required this.allPoke, @required this.current})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AboutPokeController _tabx = Get.put(AboutPokeController());
    final PokeApi _currentPoke = allPoke[current];
    Color _pokeColor = ConstsApp.getColorType(type: _currentPoke.type[0]);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 249),
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 247, 247, 249),
        bottom: TabBar(
          controller: _tabx.tabController,
          labelStyle:
              TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Google', fontSize: 16,),
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: _pokeColor,
          unselectedLabelColor: Color(0xff5f6368),
          isScrollable: true,
          indicator: MD2Indicator(
              indicatorHeight: 3,
              indicatorColor: _pokeColor,
              indicatorSize: MD2IndicatorSize.full),
          tabs: <Widget>[
            Tab(
              text: "Sobre",
            ),
            Tab(
              text: "Atributos",
            ),
            Tab(
              text: "Evolução",
            ),
          ],
        ),
      ),
    );
  }
}
