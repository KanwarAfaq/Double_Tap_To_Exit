import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Double Click to Exit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BackButton(),
    );
  }
}

class BackButton extends StatefulWidget {
  @override
  _BackButtonState createState() => _BackButtonState();
}

class _BackButtonState extends State<BackButton> {
  DateTime backbuttonpressedtime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Double Tap to Exit"),
      ),
      body:
          WillPopScope(child: Text("Double Tap to Exit"), onWillPop: onWillPop),
    );
  }

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButton;
    backButton = backbuttonpressedtime == null ||
        currentTime.difference(backbuttonpressedtime) > Duration(seconds: 3);
    if (backButton) {
      backbuttonpressedtime = currentTime;
      Fluttertoast.showToast(
          msg: "Double Tap to Exit",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      return false;
    }
    return true;
  }
}
