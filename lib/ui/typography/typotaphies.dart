import 'package:flutter/material.dart';
import 'package:todo_app_ui/ui/colors/colors.dart';

abstract class Typotaphies {
  TextStyle display({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  });
  TextStyle title({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  });
  TextStyle paragraph({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  });
  TextStyle label({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  });
}

final Typotaphies typographies = TypotaphiesImpl();

class TypotaphiesImpl implements Typotaphies {
  final String _fontFamily = 'Poppins';

  @override
  TextStyle label({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      color: color ?? AppColors.darkColor,
      fontWeight: fontWeight,
      fontSize: 12,
    );
  }

  @override
  TextStyle paragraph({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      color: color ?? AppColors.darkColor,
      fontWeight: fontWeight,
      fontSize: 14,
    );
  }

  @override
  TextStyle title({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      color: color ?? AppColors.darkColor,
      fontWeight: fontWeight,
      fontSize: 18,
    );
  }

  @override
  TextStyle display({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      color: color ?? AppColors.darkColor,
      fontWeight: fontWeight,
      fontSize: 20,
    );
  }
}
