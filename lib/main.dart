import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import './CalcBtn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _history = '';
  String _expression = '';

  //add the clicked number or operator to the expression
  void numClick(String text) {
    setState(() => _expression += text);
  }

  //delete the current expression and the history
  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  //clear the current expression
  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  //evaluate the expression if valid
  //the expression move to the history line
  //and remplace with the result
  //to keep things simple, we are not going to deal with the case where the expression is invalid
  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //The RichText widget displays text that uses multiple different styles.
        // The text to display is described using a tree of TextSpan objects,
        // each of which has an associated style that is used for that subtree.
        title: RichText(
          text: TextSpan(
              style: TextStyle(
                  letterSpacing: 5, fontSize: 18, fontWeight: FontWeight.w700),
              children: [
                TextSpan(
                    text: "S",
                    style: TextStyle(
                        fontFamily: "Audiowide",
                        fontSize: 23,
                        color: Colors.orange)),
                TextSpan(text: "imple "),
                TextSpan(
                    text: "C",
                    style: TextStyle(
                        fontFamily: "Audiowide",
                        fontSize: 23,
                        color: Colors.orange)),
                TextSpan(text: 'alculator')
              ]),
        ),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.indigoAccent,
      //Padding insets its child by the given padding.
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //Align aligns its child within itself and optionally sizes itself based on the child's size.
            Align(
              alignment: Alignment(0.9, 1.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(1.0, 1.0),
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: TextStyle(
                      fontSize: 46,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcBtn(
                  text: 'AC',
                  fillColor: Colors.black45,
                  textSize: 20,
                  callback: allClear,
                ),
                CalcBtn(
                  text: 'C',
                  fillColor: Colors.black45,
                  callback: clear,
                ),
                CalcBtn(
                  text: '%',
                  fillColor: Colors.white,
                  textColor: Colors.teal,
                  callback: numClick,
                ),
                CalcBtn(
                  text: '/',
                  fillColor: Colors.white,
                  textColor: Colors.teal,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcBtn(
                  text: '7',
                  callback: numClick,
                ),
                CalcBtn(
                  text: '8',
                  callback: numClick,
                ),
                CalcBtn(
                  text: '9',
                  callback: numClick,
                ),
                CalcBtn(
                  text: '*',
                  fillColor: Colors.white,
                  textColor: Colors.teal,
                  textSize: 24,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcBtn(
                  text: '4',
                  callback: numClick,
                ),
                CalcBtn(
                  text: '5',
                  callback: numClick,
                ),
                CalcBtn(
                  text: '6',
                  callback: numClick,
                ),
                CalcBtn(
                  text: '-',
                  fillColor: Colors.white,
                  textColor: Colors.teal,
                  textSize: 38,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcBtn(
                  text: '1',
                  callback: numClick,
                ),
                CalcBtn(
                  text: '2',
                  callback: numClick,
                ),
                CalcBtn(
                  text: '3',
                  callback: numClick,
                ),
                CalcBtn(
                  text: '+',
                  fillColor: Colors.white,
                  textColor: Colors.teal,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcBtn(
                  text: '0',
                  callback: numClick,
                ),
                CalcBtn(
                  text: '000',
                  callback: numClick,
                  textSize: 18,
                ),
                CalcBtn(
                  text: '.',
                  callback: numClick,
                ),
                CalcBtn(
                  text: '=',
                  fillColor: Colors.orange,
                  textColor: Colors.white,
                  callback: evaluate,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
