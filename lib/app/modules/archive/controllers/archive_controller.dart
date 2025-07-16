import 'package:archive_file/app/constants/pref_key.dart';
import 'package:archive_file/app/modules/model/archive_file_model.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ArchiveController extends GetxController {
  var files = <ArchiveFileModel>[].obs;
  late Box<ArchiveFileModel> fileBox;

  @override
  void onInit() {
    super.onInit();
    var box = Hive.box(PrefKey.box);
    box.put(PrefKey.archveFileList, PrefKey.archveFileList);
    var archiveFileList = box.get(PrefKey.archveFileList);
    // fileBox = Hive.box<ArchiveFileModel>(PrefKey.box);
    // var archiveFileList = fileBox.get(PrefKey.archveFileList);
    // print(archiveFileList);
    // files.assignAll(fileBox.values.toList());
    files.assignAll([
      ArchiveFileModel(
        name: 'Laporan Nasabah',
        path:
            'https://unitedcreative.oss-ap-southeast-5.aliyuncs.com/web/assets/report/Laporan_PUMK_2022.pdf',
        size: '1024 KB',
      ),
      ArchiveFileModel(
        name: 'Laporan Keuangan 2023',
        path:
            'https://unitedcreative.oss-ap-southeast-5.aliyuncs.com/web/assets/report/Laporan_PUMK_2022.pdf',
        size: '2048 KB',
      ),
      ArchiveFileModel(
        name: 'Laporan Keuangan 2024',
        path:
            'https://unitedcreative.oss-ap-southeast-5.aliyuncs.com/web/assets/report/Laporan_PUMK_2022.pdf',
        size: '1536 KB',
      ),
      ArchiveFileModel(
        name: 'Laporan TJSL',
        path:
            'https://unitedcreative.oss-ap-southeast-5.aliyuncs.com/web/assets/report/Laporan_PUMK_2022.pdf',
        size: '1024 KB',
      ),
      ArchiveFileModel(
        name: 'Laporan TJSL 2024',
        path:
            'https://unitedcreative.oss-ap-southeast-5.aliyuncs.com/web/assets/report/Laporan_PUMK_2022.pdf',
        size: '1280 KB',
      ),
      ArchiveFileModel(
        name: 'Laporan TJSL 2023',
        path:
            'https://unitedcreative.oss-ap-southeast-5.aliyuncs.com/web/assets/report/Laporan_PUMK_2022.pdf',
        size: '1280 KB',
      ),
    ]);
  }

  void uploadFile(PlatformFile file, String fileName, String remark) async {
    print('file name' + file.name);
    var box = Hive.box(PrefKey.box);
    final archiveFile =
        ArchiveFileModel(name: file.name, path: file.path ?? '');
    print('file name' + archiveFile.name.toString());
    box.put(PrefKey.archveFileList, archiveFile.toString());
    print('erman box' + box.get(PrefKey.archveFileList));
    files.assignAll(fileBox.values.toList());
  }

  void viewFile(int index) async {
    await fileBox.deleteAt(index);
    files.assignAll(fileBox.values.toList());
  }

  void updateFile(int index) async {
    await fileBox.deleteAt(index);
    files.assignAll(fileBox.values.toList());
  }

  void deleteFile(int index) async {
    await fileBox.deleteAt(index);
    files.assignAll(fileBox.values.toList());
  }
}
