import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(),
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 128, 185, 24),
          //test for commit
        ));
    
  }
}
