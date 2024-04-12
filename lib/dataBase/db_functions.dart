// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:echolens_v1/dataBase/lectures_model.dart';
import 'package:echolens_v1/pages/controls_page.dart';

ValueNotifier<List<LecturesModel>> lecturesListNotifier = ValueNotifier([]);

Future<void> addLecture(LecturesModel value) async {
  final lecturesDatabase = await Hive.openBox<LecturesModel>('lectures_db');
  final id = await lecturesDatabase.add(value);
  value.id = id;
  await lecturesDatabase.put(id, value);
  lecturesListNotifier.value.add(value);
  lecturesListNotifier.notifyListeners();
  lectureId = id;
}

Future<void> getAllLectures() async {
  final lecturesDatabase = await Hive.openBox<LecturesModel>('lectures_db');
  lecturesListNotifier.value.clear();
  lecturesListNotifier.value.addAll(lecturesDatabase.values);
  lecturesListNotifier.notifyListeners();
}

Future<void> deleteLecture(int key) async {
  final lecturesDatabase = await Hive.openBox<LecturesModel>('lectures_db');
  lecturesDatabase.delete(key);
  getAllLectures();
}

Future<void> saveLectureInDb(int key, String content) async {
  final lecturesDatabase = await Hive.openBox<LecturesModel>('lectures_db');
  final model = lecturesDatabase.get(key);
  model?.lectureContent = content;
  lecturesDatabase.put(key, model!);
}
