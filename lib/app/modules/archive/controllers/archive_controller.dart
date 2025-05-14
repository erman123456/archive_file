import 'package:archive_file/app/modules/model/archive_file_model.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hive/hive.dart';

class ArchiveController extends GetxController {
  var files = <ArchiveFileModel>[].obs;
  late Box<ArchiveFileModel> fileBox;

  @override
  void onInit() {
    super.onInit();
    fileBox = Hive.box<ArchiveFileModel>('archiveFiles');
    files.assignAll(fileBox.values.toList());
  }

  void uploadFile(PlatformFile file) async {
    final archiveFile =
        ArchiveFileModel(name: file.name, path: file.path ?? '');
    await fileBox.add(archiveFile);
    files.assignAll(fileBox.values.toList());
  }

  void deleteFile(int index) async {
    await fileBox.deleteAt(index);
    files.assignAll(fileBox.values.toList());
  }
}
