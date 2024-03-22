import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'lectures_model.g.dart';

@HiveType(typeId: 1)
class LecturesModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String lectureName;
  @HiveField(2)
  String lectureContent = 'Empty Lecture';
  LecturesModel({required this.lectureName,this.id});
}
