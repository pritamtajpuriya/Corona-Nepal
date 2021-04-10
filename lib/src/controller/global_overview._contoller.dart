import 'package:corona/src/models/world_infection_model.dart';
import 'package:corona/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  var isLoading = true.obs;
  var globalOverview = GlobleOverview().obs;
  @override
  void onInit() {
    fetchGlobalData();
    super.onInit();
  }

  void fetchGlobalData() async {
    isLoading(true);
    try {
      var data = await Repository.fetchGlobleData();
      if (data != null) {
        globalOverview.value = data;
      }
    } finally {
      isLoading(false);
    }
  }
}
