import 'package:flutter/material.dart';

class Ukuranlayar {
  static late double widht;
  static late double height;

  static void init(BuildContext context) {
    widht = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
