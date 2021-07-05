import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import '../../../../data/model/poke_api.dart';
import '../../../../data/model/specie.dart';
import '../../controllers/poke_detail_controller.dart';

class AboutTab extends StatelessWidget {
  final PokeDetailController controller;
  final Specie state;
  final List<PokeApi> allPoke;
  final int current;

  const AboutTab(
      {Key key, this.controller, this.state, this.allPoke, this.current})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.getPokeDescription(state),
                style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: 'Google',
        color: Colors.black.withOpacity(0.6),
                ),
              ),
              SizedBox(height: 10),
              Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Altura',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Google',
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  Text(
                    allPoke[current].height.replaceAll('.', ','),
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Google',
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Peso',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Google',
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  Text(
                    allPoke[current].weight.replaceAll('.', ','),
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Google',
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        )),
              SizedBox(height: 20),
              Text(
                'Biologia',
                style: TextStyle(
          fontSize: 19,
          fontFamily: 'Google',
          fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            infoTitle('Gênero'),
            infoTitle('Geração'),
            infoTitle('Forma'),
            infoTitle('Habitat'),
            infoTitle('Taxa de Cresc.'),
            infoTitle('Doce'),
          ],
        ),
        SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            infoDesc(state.genera[7].genus),
            infoDesc(state.generation.name),
            infoDesc(state.shape.name),
            infoDesc(
              state.habitat.name[0].toUpperCase() +
                  state.habitat.name.substring(1),
            ),
            infoDesc(state.growthRate.name),
            infoDesc(allPoke[current].candy),
          ],
        )
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Reprodução',
                style: TextStyle(
          fontSize: 19,
          fontFamily: 'Google',
          fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            infoTitle('Grupos de Ovos'),
            infoTitle('Distância'),
            infoTitle('Chance de Spawn'),
            infoTitle('Média de Spawns'),
            infoTitle('Hora de Spawn'),
          ],
        ),
        SizedBox(
          width: 40,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            infoDesc(controller.eggGroupParse(state.eggGroups)),
            infoDesc(allPoke[current].egg),
            infoDesc('${allPoke[current].spawnChance.toString()}%'),
            infoDesc(allPoke[current].avgSpawns.toString()),
            infoDesc(allPoke[current].spawnTime),
          ],
        )
                ],
              ),
                       
            ],
          ),
      ),
    );
  }

  Widget infoTitle(String title) {
    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
              fontSize: 17,
              fontFamily: 'Google',
              fontWeight: FontWeight.normal,
              color: Colors.black.withOpacity(0.6)),
        ),
      ],
    );
  }

  Widget infoDesc(String desc) {
    return Column(
      children: [
        SizedBox(height: 10),
        SizedBox(
          width: Get.width * 0.4,
          child: AutoSizeText(
            desc,
            maxLines: 1,
            minFontSize: 17,
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Google',
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
