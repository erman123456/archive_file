import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../controllers/archive_controller.dart';

class FileView extends GetView<ArchiveController> {
  const FileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File View'),
        centerTitle: true,
      ),
      body: Center(
        child: const PDFView(
          filePath:
              'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
        ),
      ),
    );
  }
}
