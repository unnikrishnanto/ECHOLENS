import 'package:flutter/material.dart';
import 'package:main_project/dataBase/lectures_model.dart';

ValueNotifier<List<LecturesModel>> LecturesListNotifier = ValueNotifier([]);

void addLecture(LecturesModel value) {
  LecturesListNotifier.value.add(value);
  LecturesListNotifier.notifyListeners();
}

