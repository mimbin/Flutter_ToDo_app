import 'package:flutter/material.dart';
import './models/db_models.dart';
import './models/todo_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DatabaseConnect();
  await db.insertTodo(Todo(
      id: 1,
      title: 'this is the sample todo',
      creationDate: DateTime.now(),
      isChecked: false));
  print(await db.getTodo());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }
}
