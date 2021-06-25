import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPokeController extends GetxController with SingleGetTickerProviderMixin{
  TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);

  }
}
