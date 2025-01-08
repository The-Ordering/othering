import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_ui/data/model/note_model.dart';
import 'package:todo_app_ui/ui/screens/form_screen.dart';

class NoteController extends GetxController {
  final notes = <NoteModel>[
    NoteModel(
      id: 1,
      title: 'Note 1',
      content: 'Content 1',
      dateTime: DateTime.now(),
    ),
    NoteModel(
      id: 2,
      title: 'Note 2',
      content: 'Content 2',
      dateTime: DateTime.now(),
    ),
    NoteModel(
      id: 3,
      title: 'Note 3',
      content: 'Content 3',
      dateTime: DateTime.now(),
    ),
    NoteModel(
      id: 4,
      title: 'Note 4',
      content: 'Content 4',
      dateTime: DateTime.now(),
    ),
    NoteModel(
      id: 5,
      title: 'Note 5',
      content: 'Content 5',
      dateTime: DateTime.now(),
    ),
  ].obs;

  final txtTitleCtrl = TextEditingController();
  final txtContentCtrl = TextEditingController();

  final RxBool isFormAdd = true.obs;

  late Rx<NoteModel> note;

  void viewCard(int index) async {
    note = notes[index].obs;

    txtTitleCtrl.text = note.value.title;
    txtContentCtrl.text = note.value.content;

    isFormAdd.value = false;
    Get.to(() => FormScreen());
    update();
  }

  void toBack() {
    isFormAdd.value = true;

    txtTitleCtrl.clear();
    txtContentCtrl.clear();

    Get.back();
    update();
  }
}