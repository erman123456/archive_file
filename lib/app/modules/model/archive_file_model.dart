import 'package:hive/hive.dart';

part 'archive_file_model.g.dart';

@HiveType(typeId: 0)
class ArchiveFileModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String path;

  ArchiveFileModel({required this.name, required this.path});
}
