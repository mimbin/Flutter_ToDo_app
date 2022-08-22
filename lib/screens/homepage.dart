import 'package:flutter/material.dart';
import 'package:modo/models/db_model.dart';
import '../models/todo_models.dart';
import '../widgets/user_input.dart';
import '../widgets/todo_list.dart';

class Homapage extends StatefulWidget {
  const Homapage({Key? key}) : super(key: key);

  @override
  State<Homapage> createState() => _HomapageState();
}

class _HomapageState extends State<Homapage> {
  var db = DatabaseConnect();

  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5BEFF),
      appBar: AppBar(
        title: const Text('Simple todo app'),
      ),
      body: Column(
        children: [
          Todolist(
            insertionFunction: addItem,
            deleteFunction: deleteItem,
          ),
          UserInput(insertionFunction: addItem),
        ],
      ),
    );
  }
}
