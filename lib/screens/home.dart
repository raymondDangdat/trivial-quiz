import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    "images/py.png",
    "images/js.png",
    "images/cpp.png",
    "images/java.png",
    "images/linux.png",
  ];
  Widget customCard(String topicNAme, String image){
    return Padding(
        padding: EdgeInsets.only(top: 5.0, left: 20.0, bottom: 5.0, right: 20.0),
    child: InkWell(
      onTap: (){
        print("Tapped");
      },
      child: Material(
        color: Colors.indigoAccent,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Material(
                borderRadius: BorderRadius.circular(100.0),
                elevation: 5.0,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  child: ClipOval(
                    child: Image(
                      fit: BoxFit.cover,
                        image: AssetImage(
                      image
                    )),
                  ),
                ),
              ),
              ),
              Center(
                child: Text(topicNAme, style: TextStyle(fontSize: 24.0, color: Colors.white, fontFamily: "Alike", fontWeight: FontWeight.w700),),
              ),
              Container(padding: EdgeInsets.all(20.0),
              child: Text("Description about the topic", style: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: "Alike"),
              maxLines: 5,
              textAlign: TextAlign.justify,),)
            ],
          ),
        ),
      ),
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Raaxo QUiz", style: TextStyle(fontFamily: "Quando"),),
        centerTitle: true,),
      body: ListView(
        children: [
          customCard("Python", images[0]),
          customCard("JavaScript", images[1]),
          customCard("C++", images[2]),
          customCard("Java", images[3]),
          customCard("Linux", images[4]),
        ],
      ),
    );
  }
}
