import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double first, second;
  late String res, text = "";
  late String opp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customTextButton("7"),
                customTextButton("8"),
                customTextButton("9"),
                customTextButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                customTextButton("4"),
                customTextButton("5"),
                customTextButton("6"),
                customTextButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customTextButton("1"),
                customTextButton("2"),
                customTextButton("3"),
                customTextButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customTextButton("C"),
                customTextButton("0.0"),
                customTextButton("0"),
                customTextButton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextButton(String val) {
    return Expanded(
      child: TextButton(
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: TextStyle(fontSize: 35.0, color: Colors.deepOrange),
        ),
      ),
    );
  }

  void btnClicked(String btnText) {
    if (btnText == "C") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" || btnText == "-" || btnText == "x" || btnText == "/") {
      first = double.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = double.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      } else if (opp == "-") {
        res = (first - second).toString();
      } else if (opp == "x") {
        res = (first * second).toString();
      } else if (opp == "/") {
        if (second != 0) {
          res = (first / second).toString();
        } else {
          res = "Error";
        }
      }
    } else {
      res = double.parse(text + btnText).toString();
    }
    setState(() {
      text = res;
    });
  }
}
