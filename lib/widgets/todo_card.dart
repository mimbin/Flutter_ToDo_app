import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modo/models/todo_models.dart';
import 'package:intl/intl.dart';

class Todocard extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  final Function insertionFuntion;
  final Function deleteFunction;

  Todocard(
      {required this.isChecked,
      required this.creationDate,
      required this.deleteFunction,
      required this.id,
      required this.insertionFuntion,
      required this.title,
      Key? key})
      : super(key: key);
  @override
  State<Todocard> createState() => _TodocardState();
}

class _TodocardState extends State<Todocard> {
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(
        title: widget.title,
        creationDate: widget.creationDate,
        isChecked: widget.isChecked,
        id: widget.id);
    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = value!; //TODO what the hell is
                });

                anotherTodo.isChecked = value!;
                widget.insertionFuntion(anotherTodo);
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'widget title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'date format',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8F8F8F),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              widget.deleteFunction(anotherTodo);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
