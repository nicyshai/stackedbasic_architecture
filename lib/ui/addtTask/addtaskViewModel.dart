import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../app/utils.dart';
import '../../models/category.dart';

class AddTaskViewModel extends BaseViewModel {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController priorityController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  int selectedCategoryindex = 0;
  String selectedPriority = "medium";
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isEdit = false;
  Task? existingtask;
  List<Category> categories = [
    Category(catid: 1, catname: "personal", catimage: FontAwesomeIcons.person, color: Colors.red),
    Category(catid: 2, catname: "Work", catimage: FontAwesomeIcons.upwork, color: Colors.blue),
    Category(catid: 3, catname: "Study", catimage: FontAwesomeIcons.book, color: Colors.green),
    Category(catid: 4, catname: "Shopping", catimage: FontAwesomeIcons.cartShopping, color: Colors.purple),
    Category(catid: 5, catname: "Bills", catimage: FontAwesomeIcons.bilibili, color: Colors.yellow),
  ];

  void init({Task? task}) {
    if (task != null) {
      isEdit = true;
      existingtask = task;
      titleController.text = task.title;
      descriptionController.text = task.description;
      dateController.text = task.date;
      timeController.text = task.time;
      priorityController.text = task.priority;
      selectedCategoryindex = task.catid - 1;
      selectedPriority = task.priority;
      notifyListeners();
    }
  }

  void selectCategory(int index) {
    selectedCategoryindex = index;
    notifyListeners();
  }

  void selectPriority(String value) {
    selectedPriority = value;
    notifyListeners();
  }

  void pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      selectedDate = pickedDate;
      dateController.text = DateFormat("yyyy-MM-dd").format(pickedDate);
      notifyListeners();
    }
  }

  void pickTime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (time != null) {
      selectedTime = time;
      timeController.text = time.format(context);
      notifyListeners();
    }
  }

  void saveTask() {
    if (formkey.currentState!.validate()) {
      final task = Task(
          id: isEdit ? existingtask!.id : null,
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          catid: selectedCategoryindex + 1,
          date: DateFormat("yyyy-MM-dd").format(selectedDate),
          time: timeController.text,
          priority: selectedPriority,
          iscompleted: isEdit ? existingtask!.iscompleted : false);
      try {
        if (isEdit) {
          databaseservice.updateTask(task);
        } else {
          databaseservice.insertTask(task);
        }
        navigationService.back();
      } catch (e) {
        print(e);
      }
    }
  }
}
