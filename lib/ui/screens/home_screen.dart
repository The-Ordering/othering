import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app_ui/ui/colors/colors.dart';
import 'package:todo_app_ui/ui/components/app_text_field.dart';
import 'package:todo_app_ui/ui/screens/form_screen.dart';
import 'package:todo_app_ui/ui/typography/typotaphies.dart';
import 'package:todo_app_ui/utils/device_unility.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Note',
          style: typographies.display(
            fontWeight: FontWeight.w700,
            color: AppColors.darkColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SvgPicture.asset('assets/icons/menu.svg'),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () => Get.to(() => const FormScreen()),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.primaryColor,
          child: SvgPicture.asset('assets/icons/task-add.svg'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppTextField(height: 35, hintText: "Search"),
            const SizedBox(height: 16),
            ...List.generate(
              5,
              (index) => Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                height: Rezise(context).height(80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.primaryColor.withOpacity(0.05),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Here my text title!",
                      style: typographies.paragraph(),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Here my text paragraph!",
                      style: typographies.label(),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
