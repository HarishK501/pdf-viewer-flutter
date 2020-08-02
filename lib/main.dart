import 'package:flutter/material.dart';
import 'MyApp.dart';

void main() => runApp(MyPDFViewer());

class MyPDFViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
      ),
      home: MyApp(),
    );
  }
}






