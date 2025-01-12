import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app_ui/data/controller/note_controller.dart';
import 'package:todo_app_ui/ui/colors/colors.dart';
import 'package:todo_app_ui/ui/components/app_text_field.dart';
import 'package:todo_app_ui/ui/screens/form_screen.dart';
import 'package:todo_app_ui/ui/typography/typotaphies.dart';
import 'package:todo_app_ui/utils/device/device_unility.dart';
import 'package:todo_app_ui/utils/formatter/datetime_formatter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final noteCtrl = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
              child: PopupMenuButton<String>(
                icon: SvgPicture.asset('assets/icons/menu-two-line.svg'),
                onSelected: (value) => log(value as num),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: "Sort By Name",
                    child: Text(
                      "Sort by Name",
                      style: typographies.label(fontWeight: FontWeight.w500),
                    ),
                  ),
                  PopupMenuItem(
                    value: "Sort By Date",
                    child: Text(
                      "Sort by Date",
                      style: typographies.label(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: () => Get.to(() => FormScreen()),
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
                noteCtrl.notes.length,
                (index) => Slidable(
                  endActionPane: ActionPane(
                    extentRatio: 1 / 5,
                    motion: const ScrollMotion(),
                    children: [
                      Container(
                        width: 70,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.denger,
                        ),
                        child: SvgPicture.asset('assets/icons/delete.svg'),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () async => noteCtrl.viewCard(index),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      height: Rezise(context).height(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.primaryColor.withOpacity(0.02),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            noteCtrl.notes[index].title,
                            style: typographies.paragraph(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "${DTF(noteCtrl.notes[index].dateTime!).toShortDate()}  ${noteCtrl.notes[index].content}",
                            style: typographies.label(),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}