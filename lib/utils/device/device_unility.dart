import 'package:flutter/material.dart';

class Rezise {
  final BuildContext context;
  Rezise(this.context);

  double width(double w) {
    final screenWidth = MediaQuery.of(context).size.width;
    const designWidth = 360;
    return (w / designWidth) * screenWidth;
  }

  double height(double h) {
    final screenHeiht = MediaQuery.of(context).size.width;
    const designHeight = 640;
    return (h / designHeight) * screenHeiht;
  }
}
