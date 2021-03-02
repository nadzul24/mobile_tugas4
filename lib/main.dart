import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input.dart';
import 'result.dart';
import 'convert.dart';
import 'riwayat.dart';

void main() {
  runApp(my());
}

class my extends StatefulWidget {
  @override
  myState createState() => myState();
}

class myState extends State<my> {
  TextEditingController inCelcius = new TextEditingController();

  var listItem = ["Kelvin", "Reamur", "Fahrenheit"];
  double _inputUser = 0;
  String _newValue = "Kelvin";
  double _result = 0;
  List<String> listViewItem = List<String>();

  void _hitungSuhu() {
    setState(() {
      _inputUser = double.parse(inCelcius.text);

      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else if (_newValue == "Reamur")
        _result = (4 / 5) * _inputUser;
      else
        _result = ((9 / 5) * _inputUser) + 32;

      listViewItem.add(_newValue + " : " + _result.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(inCelcius: inCelcius),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: (String changeValue) {
                  setState(() {
                    _newValue = changeValue;
                    _hitungSuhu();
                  });
                },
              ),
              Result(result: _result),
              Convert(convertHandler: _hitungSuhu),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Riwayat(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
