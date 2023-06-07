import 'package:flutter/material.dart';

import 'package:untitled/screens/home.dart';

void main() {
  runApp(const ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To DO List",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
        primarySwatch: Colors.orange,
      ),
      home: const Home(),
    );
  }
}
