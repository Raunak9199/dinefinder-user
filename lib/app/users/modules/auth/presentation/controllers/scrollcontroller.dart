import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollControllerNotification extends GetxController {
  var isValid = false.obs;
  late ScrollController scrollController;
  // To store checkbox value
  RxBool value = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        isValid.value = true;
      } else {
        isValid.value = false;
      }
    });
  }
}
