import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.inCelcius,
  }) : super(key: key);

  final TextEditingController inCelcius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: inCelcius,
        decoration: InputDecoration(hintText: "Masukkan Suhu dalam Celcius"),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9+\.]')),
        ],
        keyboardType:
            TextInputType.numberWithOptions(decimal: true, signed: false));
  }
}
