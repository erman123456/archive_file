import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

import '../controllers/archive_controller.dart';

class ArchiveView extends GetView<ArchiveController> {
  const ArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArchiveView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              if (result != null) {
                controller.uploadFile(result.files.single);
              }
            },
            child: const Text('Upload File'),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.files.length,
                  itemBuilder: (context, index) {
                    final file = controller.files[index];
                    return ListTile(
                      title: Text(file.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => controller.deleteFile(index),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
