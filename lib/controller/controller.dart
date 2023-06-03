import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  RxDouble left = 0.0.obs;
  RxDouble top = 20.0.obs;
  RxDouble containerWidth = 100.0.obs;
  RxString txt = "Hold".obs;
  RxInt number = 5.obs;
  RxDouble opacity = 0.0.obs;

  opacityVoid() {
    opacity.value = 0;
  }

  minusNumber() {
    number--;
  }

  changeHoldToRelax() {
    if (txt.value == "Hold") {
      txt.value = "Relax";
    } else {
      txt.value = "Hold";
    }
  }

  updateDraggable(DragUpdateDetails details) {
    left.value = max(0, left.value + details.delta.dx);
    top.value = max(0, top.value + details.delta.dy);
  }

  openAnimateContainer() {
    if (containerWidth.value == 100.0) {
      containerWidth.value = 300.0;
    }
  }

  closeAnimateContainer() {
    if (containerWidth.value == 300.0) {
      containerWidth.value = 100.0;
    }
  }
}
