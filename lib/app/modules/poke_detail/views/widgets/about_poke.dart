import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pokedex/app/modules/poke_detail/views/widgets/evolution_tab.dart';

import '../../../../data/model/poke_api.dart';
import '../../../../data/model/specie.dart';
import '../../../../global/consts/consts_app.dart';
import '../../controllers/poke_detail_controller.dart';
import 'about_tab.dart';

class AboutPoke extends StatelessWidget {
  final PokeDetailController controller;
  final List<PokeApi> allPoke;
  final int current;
  final Specie state;

  const AboutPoke(
      {Key key,
      @required this.allPoke,
      @required this.current,
      @required this.controller,
      this.state})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PokeApi _currentPoke = allPoke[current];
    Color _pokeColor = ConstsApp.getColorType(type: _currentPoke.type[0]);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 249),
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 247, 247, 249),
        bottom: TabBar(
          onTap: (index) {
            controller.currentInfo.value = index;
            controller.aboutPageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
          controller: controller.tabController,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Google',
            fontSize: 16,
          ),
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
      body: PageView(
        onPageChanged: (index) {
          controller.currentInfo.value = index;
          controller.tabController
              .animateTo(index, duration: Duration(milliseconds: 300));
        },
        controller: controller.aboutPageController,
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: AboutTab(
              controller: controller,
              state: state,
              allPoke: allPoke,
              current: current,
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
                      child: EvolutionTab(
              allPoke: allPoke,
              controller: controller,
              current: current,
              state: state,
            ),
          )
        ],
      ),
    );
  }
}
