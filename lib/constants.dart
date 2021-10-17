import 'package:flutter/material.dart';

AppBar myAppBar({title}){
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.black87,
    elevation: 20.0,
    shadowColor: Colors.white,
    toolbarHeight: 70,
  );
}