 import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trivial/screens/home.dart';

class SPlashScreen extends StatefulWidget {
  @override
  _SPlashScreenState createState() => _SPlashScreenState();
}

class _SPlashScreenState extends State<SPlashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      
      body: Center(
        child: Text("Raaxo Quiz ", style: TextStyle(fontSize: 50.0, color: Colors.white, fontFamily: "Satisfy"),),
      ),
    );
  }
}
