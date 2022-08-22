import 'package:flutter/material.dart';
import '../models/db_model.dart';
import 'todo_card.dart';

class Todolist extends StatelessWidget {
  final Function insertionFunction;
  final Function deleteFunction;
  var db = DatabaseConnect();

  Todolist(
      {required this.insertionFunction, required this.deleteFunction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalength = data!.length;

          return datalength == 0
              ? const Center(
                  child: Text('no data found'),
                )
              : ListView.builder(
                  itemCount: datalength,
                  itemBuilder: (context, i) => Todocard(
                    id: data[i].id,
                    isChecked: data[i].isChecked,
                    creationDate: data[i].creationDate,
                    title: data[i].title,
                    deleteFunction: insertionFunction,
                    insertionFuntion: deleteFunction,
                  ),
                );
        },
      ),
    );
  }
}
