import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eproxy/constants.dart';

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
      body: Column(
        children: [
          _textInput(text: 'Roll Number',keyboardType: TextInputType.number),
          _textInput(text: 'Name',keyboardType: TextInputType.text)
        ],
      ),
    );
  }
}
Widget _textInput({text,keyboardType}){
  return Padding(
    padding: const EdgeInsets.only(top: 30,left: 40,right: 40),
    child: TextField(
      onChanged: (value){},
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,letterSpacing: 0.6),
      keyboardType: keyboardType,

      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.white),
        ),
        labelText: text,
        hintText: 'Enter Your '+ text,
      ),
    ),
  );
}