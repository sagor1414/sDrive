import 'package:sdrive/app/file/model/file_model.dart';

import 'pdf_viewer.dart';

showFile(FileModel file, context) {
  if (file.fileExtension == 'pdf') {
    return PdfViewer(
      file: file,
    );
  } else {}
}
