import 'package:flutter/material.dart';
import 'package:modo/models/todo_models.dart';

class UserInput extends StatelessWidget {
  var textController = TextEditingController();
  UserInput({required this.insertionFunction, Key? key}) : super(key: key);

  final Function insertionFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              controller: textController,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                hintText: 'add new modo',
                border: InputBorder.none,
              ),
            ),
          )),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              var myTodo = Todo(
                  title: textController.text,
                  creationDate: DateTime.now(),
                  isChecked: false);
              insertionFunction(myTodo);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
