import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_ui/data/controller/note_controller.dart';
import 'package:todo_app_ui/ui/colors/colors.dart';
import 'package:todo_app_ui/ui/components/app_text_field.dart';
import 'package:todo_app_ui/ui/typography/typotaphies.dart';
import 'package:todo_app_ui/utils/formatter/datetime_formatter.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});

  final noteCtrl = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => noteCtrl.toBack(),
                icon: const Icon(Icons.arrow_back_ios, size: 20),
              ),
              Text(
                DTF(
                  noteCtrl.isFormAdd.value
                      ? DateTime.now()
                      : noteCtrl.note.value.dateTime!,
                ).toShortHumanReadable().toString(),
                style: typographies.paragraph(),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Text(
                  'Save',
                  style: typographies.paragraph(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              AppTextField(
                controller: noteCtrl.txtTitleCtrl,
                height: 35,
                isBlankStyle: true,
                hintText: "title",
                style: typographies.title(color: AppColors.darkColor),
                maxLength: 50,
                hintStyle: typographies.title(
                    color: AppColors.darkColor.withOpacity(0.6)),
              ),
              AppTextField(
                controller: noteCtrl.txtContentCtrl,
                isBlankStyle: true,
                hintText: "Start writing...",
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
