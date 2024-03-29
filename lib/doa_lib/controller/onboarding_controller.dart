import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doa/doa_lib/controller/main_controller.dart';
import 'package:doa/doa_lib/routes.dart';
import 'package:doa/doa_lib/style/colors.dart';

class OnBoardingController extends GetxController {
  RxInt corouselIndex = 0.obs;
  Color carouselIndexColor(int i) {
    return corouselIndex.value == i ? BLUE_DARK : GREY;
  }

  Function(int index, CarouselPageChangedReason reason)? onPageChanged() {
    return (index, reason) {
      corouselIndex.value = index;
    };
  }

  void Function()? next() {
    return () async {
      return await Get.toNamed(ROUTE.preRegister.name);
    };
  }

  @override
  void onInit() {
    super.onInit();
    Get.put(MainController());
  }
}
