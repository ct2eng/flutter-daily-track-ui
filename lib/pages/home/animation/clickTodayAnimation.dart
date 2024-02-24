import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ClickTodayAnimation extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _ctl;
  late AnimationStatusListener listener;
  double periodInt = 1;
  @override
  void onInit() {
    super.onInit();
    _ctl =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _ctl.addListener(() {
      var tmpval = _ctl.value * -1 + 1;

      periodInt = tmpval;
      update();
    });
  }

  @override
  void onClose() {
    super.onClose();
    _ctl.stop();
    _ctl.dispose();
  }

  void prepareToIdle() {
    listener = (AnimationStatus statue) {
      if (statue == AnimationStatus.completed) {
        _ctl.removeStatusListener(listener);
        toStart();
      }
    };
    _ctl.addStatusListener(listener);
    if (!_ctl.isAnimating) {
      _ctl.removeStatusListener(listener);
      toStart();
    }
  }

  void toStart() {
    _ctl.stop();
    _ctl.reverse();
  }

  void tapDown() {
    _ctl.forward();
  }
}
