import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(numberShapes());
}

class numberShapes extends StatelessWidget {
  const numberShapes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: numberShapes_stful(),
    );
  }
}

class numberShapes_stful extends StatefulWidget {
  const numberShapes_stful({Key? key}) : super(key: key);

  @override
  State<numberShapes_stful> createState() => _numberShapes_stfulState();
}

class _numberShapes_stfulState extends State<numberShapes_stful> {
  final TextEditingController _controller = TextEditingController();
  String textValue = '';

  void onPressed() {
    setState(() {
      if ((sqrt(num.parse(textValue)) % 1) != 0)
        print('Number is a square ');
      else
        print('Number is not a square ');

      int _value = int.parse(textValue);
      bool cubeFound = false;
      // Iterate from 1-value
      for (int i = 0; i <= _value; i++) {
        int cube;
        // Find the cube of
        // every number
        cube = i * i * i;

        // Check if cube equals
        if (cube == _value) {
          cubeFound = true;
          print(' and a triangle.');
          return;
        }
      }
      if (cubeFound == false) print(' and not a triangle.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Shapes'),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Please input a number to check if it is triangular or a square',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
              inputFormatters: <FilteringTextInputFormatter>[
                FilteringTextInputFormatter('1234567890', allow: true)
              ],
              style: TextStyle(
                backgroundColor: Colors.black54,
              ),
              keyboardType: TextInputType.number,
              controller: _controller,
              onChanged: (value) {
                textValue = value;
              }),
          ElevatedButton(
            onPressed: onPressed,
            child: Text('Verify'),
          )
        ],
      ),
    );
  }
}
