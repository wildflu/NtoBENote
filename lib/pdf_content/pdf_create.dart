import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:yfalse/pdf_content/pdf_to_img.dart';

import '../db/db_sqflite.dart';

Litedb litedb = Litedb();

class PDfGenerater {
  static List<Map>? x;

  static createPdf() async {
    x = await litedb.read("audio");
    String path = (await getApplicationDocumentsDirectory()).path;

    File file = File(path + 'My_First_PDF.pdf');
    print(file);

    Document pdf = Document();
    pdf.addPage(_createPage());

    Uint8List bytes = await pdf.save();
    await file.writeAsBytes(bytes);
  }

  // for try

  // open as a PDF
  static OpenPdf() async {
    String path = (await getApplicationDocumentsDirectory()).path;

    File file = File(path + 'My_First_PDF.pdf');

    await OpenFile.open(file.path);
  }

  // Open As Img
  static OpenImg() async {
    String path = (await getApplicationDocumentsDirectory()).path;

    File file = File(path + 'My_First_PDF.pdf');

    createImg(file.path);
  }

  // end try




  static Page _createPage() {
    return Page(build: (context) {
      return Container(
        child: ListView.builder(
          itemCount: x!.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              child: Text(x![index]['text']),
            );
          },
        ),
      );
    });
  }

  static createImg(String path) {
    PdfConvertToImg.convertToImg(path);
  }
}
