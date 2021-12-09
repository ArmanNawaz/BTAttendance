import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eproxy/constants.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

var selectedClass = 'Select Class';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: 'Register Students'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textInput(text: 'Roll Number', keyboardType: TextInputType.number),
            _textInput(text: 'Name', keyboardType: TextInputType.text),
            _textInput(text: 'Bluetooth MAC Address', keyboardType: TextInputType.text),
            Container(
              margin: const EdgeInsets.only(top: 32),
              padding: const EdgeInsets.only(top: 6, left: 15),

              height: 64,
              width: 310,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black),
              ),
              child: DropdownButton(
                borderRadius: BorderRadius.circular(20),
                focusColor: Colors.blue,
                hint: Text(selectedClass),
                style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 0.6),
                onChanged: (String? value) {
                  setState(() {
                    selectedClass = value!;
                  });
                },
                underline: const SizedBox(height: 1,),
                items: <String>['CS 3A', 'CS 3B', 'CS 3C', 'CS 3D', 'CS 3E']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              height: 60,
              width: 240,
              margin: EdgeInsets.only(top: 40),
              child: ElevatedButton(
                child: const Text(
                    'Register',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                  ),
                ),
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.black,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: const BorderSide(
                    color: Colors.black26,
                    width: 1.6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _textInput({text, keyboardType}) {
  return Padding(
    padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
    child: TextField(
      onChanged: (value) {},
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 0.6),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.white),
        ),
        labelText: text,
        hintText: 'Enter Your ' + text,
      ),
    ),
  );
}
