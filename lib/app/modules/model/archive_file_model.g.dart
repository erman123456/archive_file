// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_file_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArchiveFileModelAdapter extends TypeAdapter<ArchiveFileModel> {
  @override
  final int typeId = 0;

  @override
  ArchiveFileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArchiveFileModel(
      id: fields[2] as int,
      name: fields[0] as String,
      path: fields[1] as String,
      size: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ArchiveFileModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.path)
      ..write(obj.size);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArchiveFileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
