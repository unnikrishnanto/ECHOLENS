// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lectures_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LecturesModelAdapter extends TypeAdapter<LecturesModel> {
  @override
  final int typeId = 1;

  @override
  LecturesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LecturesModel(
      lectureName: fields[1] as String,
      id: fields[0] as int?,
    )..lectureContent = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, LecturesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.lectureName)
      ..writeByte(2)
      ..write(obj.lectureContent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LecturesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
