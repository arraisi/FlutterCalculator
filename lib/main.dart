import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String _output = '0';
  double number1 = 0.0;
  double number2 = 0.0;
  String operand = '';

  buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      _output = '0';
      number1 = 0.0;
      number2 = 0.0;
      operand = '';
    } else if (buttonText == '/' ||
        buttonText == 'X' ||
        buttonText == '-' ||
        buttonText == '+') {
      number1 = double.parse(output);
      _output = '0';
      operand = buttonText;
    } else if (buttonText == '.') {
      if (_output.contains('.')) {
        print('Number Already Decimals');
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      number2 = double.parse(output);

      if (operand == '/') {
        _output = (number1 / number2).toString();
      }
      if (operand == 'X') {
        _output = (number1 * number2).toString();
      }
      if (operand == '-') {
        _output = (number1 - number2).toString();
      }
      if (operand == '+') {
        _output = (number1 + number2).toString();
      }

      number1 = 0.0;
      number2 = 0.0;
      operand = '';
    } else {
      if (operand == '') {
        _output = '0';
      }
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
        child: new OutlineButton(
      padding: EdgeInsets.all(24.0),
      child: new Text(
        buttonText,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      onPressed: () => buttonPressed(buttonText),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                  alignment: Alignment.centerRight,
                  padding: new EdgeInsets.symmetric(
                    vertical: 45.0,
                    horizontal: 12.0,
                  ),
                  child: new Text(
                    output,
                    style: new TextStyle(
                        fontSize: 48.0, fontWeight: FontWeight.bold),
                  )),
              new Expanded(child: new Divider()),
              new Column(
                children: [
                  new Row(children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/'),
                  ]),
                  new Row(children: [
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('X'),
                  ]),
                  new Row(children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ]),
                  new Row(children: [
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('+'),
                  ]),
                  new Row(children: [
                    buildButton('CLEAR'),
                    buildButton('='),
                  ]),
                ],
              )
            ],
          ),
        ));
  }
}
