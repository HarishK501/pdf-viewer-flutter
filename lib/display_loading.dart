import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'PDFScreen.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';



class Loading extends StatefulWidget {
  final String textFromController;
  final String type;
  Loading({this.textFromController,@required this.type});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    if (widget.type == "url"){
      takeToPDFFromURL();
    }
    else if (widget.type == "local"){
      getFromDevice();
    }

  }


  void takeToPDFFromURL() async{
    try{
        PDFDocument file = await PDFDocument.fromURL(widget.textFromController);
        Navigator.push(context,MaterialPageRoute(builder: (context) => PDFScreen(file)));
    }catch(e){
      Navigator.of(context).pop();
    }

  }

  void getFromDevice() async{
    File file = await FilePicker.getFile(type: FileType.any);
    PDFDocument doc = await PDFDocument.fromFile(file);
    if (file != null){
      Navigator.push(context,MaterialPageRoute(builder: (context) => PDFScreen(doc)));
    }
    else{
      Navigator.of(context).pop();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}




