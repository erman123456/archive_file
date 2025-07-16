import 'package:hive/hive.dart';

part 'archive_file_model.g.dart';

@HiveType(typeId: 0)
class ArchiveFileModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String path;

  @HiveField(2)
  String size;

  @HiveField(2)
  int id;

  ArchiveFileModel(
      {required this.name,
      required this.path,
      this.size = '',
      required this.id});
}
