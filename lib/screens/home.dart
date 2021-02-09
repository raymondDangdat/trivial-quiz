import 'package:flutter/material.dart';
import 'package:trivial/screens/quiz_screen.dart';
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

  List<String> des = [
    "Python is one of the most popular and fastest programming language since half a decade.\nIf You think you have learnt it.. \nJust test yourself !!",
    "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
    "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
    "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !",
    "Linux is a OPEN SOURCE Operating System which powers many Servers and Workstation.\nIt is also a top Priority in Developement Work !",
  ];

  Widget customCard(String langName, String image, String des){
    return Padding(
        padding: EdgeInsets.only(top: 5.0, left: 20.0, bottom: 5.0, right: 20.0),
    child: InkWell(
      onTap: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => GetJson(langName) ));
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
                child: Text(langName, style: TextStyle(fontSize: 24.0, color: Colors.white, fontFamily: "Alike", fontWeight: FontWeight.w700),),
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
          customCard("Python", images[0], des[0]),
          customCard("JavaScript", images[1], des[1]),
          customCard("C++", images[2], des[2]),
          customCard("Java", images[3], des[3]),
          customCard("Linux", images[4], des[4]),
        ],
      ),
    );
  }
}
