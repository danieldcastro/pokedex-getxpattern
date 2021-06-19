import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/poke_detail_controller.dart';

class PokeDetailView extends GetView<PokeDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokeDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          controller.poke.name,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
