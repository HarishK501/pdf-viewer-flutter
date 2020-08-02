import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';


class PDFScreen extends StatelessWidget {
  final PDFDocument file;
  PDFScreen(this.file);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: ()  {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
      body: PDFViewer(
        document: file,


      ),
    );

  }
}