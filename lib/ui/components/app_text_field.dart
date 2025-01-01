import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_ui/ui/colors/colors.dart';
import 'package:todo_app_ui/ui/typography/typotaphies.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.isBlankStyle = false,
      this.height,
      this.hintText,
      this.style,
      this.hintStyle,
      this.keyboardType,
      this.maxLines = 1,
      this.maxLength});

  final bool isBlankStyle;
  final double? height;
  final String? hintText;
  final TextStyle? style, hintStyle;
  final TextInputType? keyboardType;
  final int? maxLines, maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: height,
      decoration: isBlankStyle
          ? BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: TextField(
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          buildCounter: (context,
                  {required currentLength,
                  required isFocused,
                  required maxLength}) =>
              null,
          style: style ?? typographies.paragraph(color: AppColors.darkColor),
          decoration: InputDecoration(
            border: InputBorder.none,
            // contentPadding: const EdgeInsets.only(bottom: 13),
            prefixIcon: !isBlankStyle
                ? Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 3),
                    child: SvgPicture.asset(
                      "assets/icons/search.svg",
                    ),
                  )
                : null,
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                  color: AppColors.darkColor.withOpacity(0.5),
                ),
          ),
        ),
      ),
    );
  }
}
