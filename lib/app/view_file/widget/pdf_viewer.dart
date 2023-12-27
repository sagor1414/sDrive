import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sdrive/app/file/model/file_model.dart';
import 'package:http/http.dart' as http;
import 'package:sdrive/app/widgets/loading_indicator.dart';

class PdfViewer extends StatefulWidget {
  final FileModel file;
  const PdfViewer({super.key, required this.file});

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  bool initialzed = false;
  late File pdfFile;
  loadpdfFile(FileModel file) async {
    final response = await http.get(Uri.parse(file.url));
    final bytes = response.bodyBytes;
    return storeFile(file, bytes);
  }

  storeFile(FileModel file, List<int> bytes) async {
    final dir = await getApplicationDocumentsDirectory();
    final filename = File("${dir.path}/${file.name}");
    await filename.writeAsBytes(bytes, flush: true);
    return filename;
  }

  initializepdf() async {
    pdfFile = await loadpdfFile(widget.file);
    initialzed = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initializepdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initialzed
          ? PDFView(
              filePath: pdfFile.path,
              fitEachPage: false,
            )
          : Loadingindicator(color: Colors.deepOrangeAccent),
    );
  }
}
