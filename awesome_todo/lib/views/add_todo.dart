import 'package:awesome_todo/database/todojson_model.dart';
import 'package:awesome_todo/provider/provider_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final databaseProvider =
        Provider.of<DatabaseProvider>(context, listen: false);

    final TextEditingController title = TextEditingController();

    final TextEditingController content = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: title,
              decoration: InputDecoration(
                hintText: 'Task Title',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 6,
              controller: content,
              decoration: InputDecoration(
                hintText: 'Description',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                databaseProvider
                    .addToDo(ToDo(
                        title: title.text,
                        content: content.text,
                        isCompleted: false))
                    .whenComplete(() => Navigator.pop(context));
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
