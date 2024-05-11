import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  final int ms;

  Debounce({this.ms = 500});
  Timer? timer;

  void run(VoidCallback action) {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: ms), action);
  }
}
