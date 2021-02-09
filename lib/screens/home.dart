import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget customCard(){
    return Padding(
        padding: EdgeInsets.all(20.0),
    child: Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Material(
              child: Container(
                height: 200.0,
                width: 20.0,
                child: ClipOval(
                  child: Image(image: AssetImage(
                    "images/py.png"
                  )),
                ),
              ),
            ),)
          ],
        ),
      ),
    ),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Raaxo QUiz", style: TextStyle(fontFamily: "Quando"),),
        centerTitle: true,),
      body: ListView(
        children: [
          customCard(),
        ],
      ),
    );
  }
}
