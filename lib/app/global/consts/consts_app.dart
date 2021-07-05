import 'package:flutter/material.dart';

class ConstsApp {
  static const WHITE_POKE = 'assets/images/pokeball.png';
  static const BLACK_POKE = 'assets/images/pokeball_dark.png';
  static const IMG_URL =
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/';

  static Color getColorType({@required String type}) {
    switch (type) {
      case 'Normal':
        return Color.fromARGB(255, 145, 154, 162);
        break;
      case 'Fogo':
        return Color.fromARGB(255, 255, 157, 85);
        break;
      case 'Água':
        return Color.fromARGB(255, 88, 144, 214);
        break;
      case 'Planta':
        return Color.fromARGB(255, 72, 208, 176);
        break;
      case 'Elétrico':
        return Color.fromARGB(255, 244, 210, 60);
        break;
      case 'Gelo':
        return Color.fromARGB(255, 115, 206, 192);
        break;
      case 'Lutador':
        return Color.fromARGB(255, 206, 65, 107);
        break;
      case 'Venenoso':
        return Color.fromARGB(255, 181, 103, 206);
        break;
      case 'Terra':
        return Color.fromARGB(255, 217, 120, 69);
        break;
      case 'Voador':
        return Color.fromARGB(255, 137, 170, 227);
        break;
      case 'Psíquico':
        return Color.fromARGB(255, 247, 120, 107);
        break;
      case 'Inseto':
        return Color.fromARGB(255, 145, 193, 47);
        break;
      case 'Pedra':
        return Color.fromARGB(255, 197, 183, 140);
        break;
      case 'Fantasma':
        return Color.fromARGB(255, 82, 105, 173);
        break;
      case 'Sombrio':
        return Color.fromARGB(255, 90, 84, 101);
        break;
      case 'Dragão':
        return Color.fromARGB(255, 11, 109, 195);
        break;
      case 'Aço':
        return Color.fromARGB(255, 80, 144, 214);
        break;
      case 'Fada':
        return Color.fromARGB(255, 236, 143, 230);
        break;
      default:
        return Colors.grey;
        break;
    }
  }

  static String parseId(int id) {
    String newId;
    switch (id.toString().length) {
      case 1:
        newId = '00$id';
        break;
      case 2:
        newId = '0$id';
        break;
      case 3:
        newId = '$id';
    }
    return newId;
  }
}
