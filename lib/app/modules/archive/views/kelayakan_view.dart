import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/archive_controller.dart';

class KelayakanView extends GetView<ArchiveController> {
  const KelayakanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Uji Kelayakan',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(26.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade700,
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) {
                final TextEditingController nameController =
                    TextEditingController();
                final TextEditingController remarkController =
                    TextEditingController();
                return AlertDialog(
                  title: const Text('Upload New File'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'File Name',
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: remarkController,
                        decoration: const InputDecoration(
                          labelText: 'Remark',
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null && result.files.isNotEmpty) {
                            controller.uploadFile(
                              result.files.first,
                              nameController.text,
                              remarkController.text,
                            );
                          }
                        },
                        child: const Text('Choose File'),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Submit'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text(
            'Upload New File',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      body: Obx(
        () => controller.files.isEmpty
            ? const Center(child: Text('No archived files.'))
            : ListView.builder(
                itemCount: controller.files.length,
                itemBuilder: (context, index) {
                  final file = controller.files[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    child: ListTile(
                      leading: const Icon(Icons.insert_drive_file),
                      title: Text(file.name),
                      subtitle: Text(file.size ?? 'Unknown size'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.visibility),
                            tooltip: 'View',
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(file.name),
                                  content: SingleChildScrollView(
                                    child: SizedBox(
                                      width: double.maxFinite,
                                      height: 500,
                                      child: SfPdfViewer.network(
                                        file.path ?? '',
                                        canShowScrollHead: false,
                                        canShowScrollStatus: false,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            tooltip: 'Edit',
                            onPressed: () => controller.updateFile(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            tooltip: 'Delete',
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Are you sure?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    content: const Text(
                                        'Do you want to delete this file?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            controller.deleteFile(index),
                                        child: const Text('Yes'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('No'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
