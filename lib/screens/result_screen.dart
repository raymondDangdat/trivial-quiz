import 'package:flutter/material.dart';
import 'package:trivial/screens/home.dart';
class ResultScreen extends StatefulWidget {
  int marks;
  ResultScreen({Key key, @required this.marks}) : super(key: key);
  @override
  _ResultScreenState createState() => _ResultScreenState(marks);
}

class _ResultScreenState extends State<ResultScreen> {
  List<String> images = [
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;

  @override
  void initState(){
    if(marks < 20){
      image = image[2];
      message = "Try hard next time...\n" + "You Scored $marks";
    }else if(marks < 35){
      image = images[1];
      message = "Try can do better...\n" + "You Scored $marks";
    }else{
      image = images[0];
      message = "You did very well...\n" + "You Scored $marks";
    }

    super.initState();
  }

  int marks;


  _ResultScreenState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
              child: Material(
                elevation: 2.0,
                child: Container(
                  child: Column(
                    children: [
                      Material(
                        elevation: 2.0,
                        child: Container(
                          width: 300.0,
                          height: 300.0,
                          child: ClipRect(
                            child: Image(
                                image: AssetImage(image)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                        child: Center(
                          child: Text(message, style: TextStyle(fontSize: 20.0, fontFamily: "Quando"),)
                        ),
                      )
                    ],
                  )
                ),
              )),
          Expanded(
            flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlineButton(onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    child: Text("Continue", style: TextStyle(fontSize: 18.0, ),),
                  ),
                  borderSide: BorderSide(width: 3.0, color: Colors.indigo),
                  splashColor: Colors.indigoAccent,)
                ],
              ))
        ],
      ),
    );
  }
}
