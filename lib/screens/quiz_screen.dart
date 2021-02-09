import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:trivial/screens/result_screen.dart';

class GetJson extends StatelessWidget {
  String langName;
  GetJson(this.langName);
  String assetToLoad;

  // a function
  // sets the asset to a particular JSON file
  // and opens the JSON
  setasset() {
    if (langName == "Python") {
      assetToLoad = "assets/python.json";
    } else if (langName == "Java") {
      assetToLoad = "assets/java.json";
    } else if (langName == "Javascript") {
      assetToLoad = "assets/js.json";
    } else if (langName == "C++") {
      assetToLoad = "assets/cpp.json";
    } else {
      assetToLoad = "assets/linux.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/java.json"),
      builder: (context, snapshot){
        List data = json.decode(snapshot.data.toString());
        if(data == null){
          return Scaffold(
            body: Center(child: new Text("Loading...")),
          );
        }else{
          return QuizScreen(myData : data);
        }
      },
    );
  }
}

class QuizScreen extends StatefulWidget {
  var myData;
  QuizScreen({Key key, @required this.myData}) : super(key: key);
  @override
  _QuizScreenState createState() => _QuizScreenState(myData);
}

class _QuizScreenState extends State<QuizScreen> {
  var myData;
  _QuizScreenState(this.myData);

  Color colorToShow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;

  int marks = 0;
  int i = 1;
  int timer = 30;
  String showTimer = "30";
  Map<String, Color> btnColor = {
    "a" :Colors.indigoAccent,
    "b" :Colors.indigoAccent,
    "c" :Colors.indigoAccent,
    "d" :Colors.indigoAccent,
  };

  bool cancelTimer = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() async{
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        if(timer < 1){
          t.cancel();
          nextQuestion();
        }else if(cancelTimer == true){
          t.cancel();
        }else{
          timer = timer - 1;
        }
        showTimer = timer.toString();
      });
    });
  }

  void nextQuestion(){
    cancelTimer = false;
    timer = 30;

    setState(() {
      if( i < 10){
        i++;
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ResultScreen(marks : marks)));
      }
      btnColor['a'] = Colors.indigoAccent;
      btnColor['b'] = Colors.indigoAccent;
      btnColor['c'] = Colors.indigoAccent;
      btnColor['d'] = Colors.indigoAccent;

    });
    startTimer();
  }

  void checkAnswer(String k){
    if(myData[2]['1'] == myData[1]['1'][k]){
      marks = marks + 5;
      colorToShow = right;
    }else {
      colorToShow = wrong;
    }

    setState(() {
      btnColor[k] = colorToShow;
      cancelTimer = true;
    });
    
    Timer(Duration(seconds: 2), nextQuestion);
  }

  Widget choiceButton(String k){
    return Padding(padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    child: MaterialButton(onPressed: () => checkAnswer(k),
      color: btnColor[k],
      minWidth: 200.0,
      height: 45.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      splashColor: Colors.indigo[700],
      highlightColor: Colors.indigo[700],
    child: Text(myData[1][i.toString()][k], style: TextStyle(color: Colors.white, fontFamily: "Alike", fontSize: 16.0),),)
      ,);
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return WillPopScope(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    alignment: Alignment.bottomLeft,
                    child: Text(myData[0][i.toString()], style: TextStyle(fontSize: 16.0, fontFamily: "Quando"),
                      ),
                  )),
              Expanded(
                  flex: 6,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        choiceButton('a'),
                        choiceButton('b'),
                        choiceButton('c'),
                        choiceButton('d'),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: Text(showTimer,
                        style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Times New Roman"
                        ),),
                    ),
                  )),
            ],
          ),
        ),
        onWillPop: (){
          return showDialog(
              context: context,
          builder: (context) => AlertDialog(
            title: Text('Raaxo Quiz'),
            content: Text("You can't go back at this stage."),
            actions: [
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  child: Text("Ok"))
            ],
          ));
        });
  }
}

