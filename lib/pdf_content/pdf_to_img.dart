import 'dart:io';

import 'package:native_pdf_renderer/native_pdf_renderer.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PdfConvertToImg {
  static convertToImg(String pdfPath) async{
    PdfDocument doc = await PdfDocument.openFile(pdfPath);
    PdfPage page = await doc.getPage(1);

    final PdfPageImage? pageImg = await page.render(width: page.width , height: page.height,backgroundColor: "#ffffff");

    if(pageImg!=null) {
      String path = (await getApplicationDocumentsDirectory()).path;
      File file = File(path + "FINAL.png");

      await file.writeAsBytes(pageImg.bytes);

      OpenFile.open(file.path);
    }
  }
}