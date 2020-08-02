import 'package:flutter/material.dart';
import 'package:mypdfviewer/display_loading.dart';
import 'package:mypdfviewer/reusable_card.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String path="";
  TextEditingController myController = TextEditingController();

  Future<Widget> getFromURL(BuildContext context) async{
    myController.text="";
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            backgroundColor: Color(0xFF1D1E33),
            title: Text('Enter URL😇'),
            content: TextField(
              controller: myController,
              decoration: InputDecoration(hintText: "Paste your URL here."),
            ),
            actions: <Widget>[
              RaisedButton(
                child: new Text('OK'),
                color: Colors.lightGreen,
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Loading(textFromController: myController.text,type: "url",)));
                },
              ),
              FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(title: const Text('My PDF Viewer')),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/sample5.png'),
              fit: BoxFit.fitHeight,

            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.link,
                          size: 100.0,
                        ),
                        Text(
                          'Open PDF from URL',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold
                          ),
                        )

                      ],
                    ),
                    onPress: () {
                      getFromURL(context);
                    },
                  ),
                  ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.folder_open,
                          size: 90.0,
                        ),
                        Text(
                          'Open PDF from Device',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold

                          ),

                        )

                      ],
                    ),
                    onPress: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Loading(type: "local",)));
                    },
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }
}