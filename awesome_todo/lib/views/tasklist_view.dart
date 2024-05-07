import 'package:awesome_todo/provider/provider_db.dart';
import 'package:awesome_todo/views/add_todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, value, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddTodo(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
          backgroundColor: Colors.transparent,
          body: value.todo.isEmpty
              ? const Center(
                  child: Text('No Task Has Been added'),
                )
              : ListView.builder(
                  itemCount: value.todo.length,
                  itemBuilder: (context, index) {
                    return null;
                  },
                ),
        );
      },
    );
  }
}
