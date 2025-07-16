import 'package:archive_file/app/constants/pref_key.dart';
import 'package:archive_file/app/modules/model/archive_file_model.dart';
import 'package:flutter/material.dart';
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
        id: 1,
        name: 'Laporan Nasabah',
        path:
            'https://unitedcreative.oss-ap-southeast-5.aliyuncs.com/web/assets/report/Laporan_PUMK_2022.pdf',
        size: '1024 KB',
      ),
      ArchiveFileModel(
        id: 2,
        name: 'Laporan Keuangan 2023',
        path:
            'https://unitedcreative.oss-ap-southeast-5.aliyuncs.com/web/assets/report/Laporan_PUMK_2022.pdf',
        size: '2048 KB',
      ),
      ArchiveFileModel(
        id: 3,
        name: 'Laporan Keuangan 2024',
        path:
            'https://unitedcreative.oss-ap-southeast-5.aliyuncs.com/web/assets/report/Laporan_PUMK_2022.pdf',
        size: '1536 KB',
      ),
      ArchiveFileModel(
        id: 4,
        name: 'Laporan TJSL',
        path:
            'https://unitedcreative.oss-ap-southeast-5.aliyuncs.com/web/assets/report/Laporan_PUMK_2022.pdf',
        size: '1024 KB',
      ),
      ArchiveFileModel(
        id: 5,
        name: 'Laporan TJSL 2024',
        path:
            'https://unitedcreative.oss-ap-southeast-5.aliyuncs.com/web/assets/report/Laporan_PUMK_2022.pdf',
        size: '1280 KB',
      ),
      ArchiveFileModel(
        id: 6,
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
    final archiveFile = ArchiveFileModel(
        name: file.name, path: file.path ?? '', id: files.length + 1);
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

  void deleteFile(int id) async {
    files.removeWhere((file) => file.id == id);
    Get.back();
    Get.snackbar(
      'File Deleted',
      'The file has been successfully deleted.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.shade100,
      duration: const Duration(seconds: 2),
    );
    // await fileBox.deleteAt(id);
    // files.assignAll(fileBox.values.toList());
  }
}
