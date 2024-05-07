import 'package:awesome_todo/database/db_helper.dart';
import 'package:awesome_todo/database/todojson_model.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  List<ToDo> _todo = [];
  List<ToDo> get todo => _todo;

  //fetch Todo from database
  Future<void> fetchToDo() async {
    await _databaseHelper.initDB();
    _todo = await _databaseHelper.getToDo();
    notifyListeners();
  }

  //ToDo Add
  Future<void> addToDo(ToDo todo) async {
    await _databaseHelper.initDB();
    _databaseHelper.addToDo(todo);
    await fetchToDo();
  }

  //ToDo Update
  Future<void> updateToDo(ToDo todo) async {
    await _databaseHelper.initDB();
    _databaseHelper.updateToDo(todo);
    await fetchToDo();
  }

  // ToDo Delete
  Future<void> deleteToDo(int id) async {
    await _databaseHelper.initDB();
    _databaseHelper.deleteToDo(id);
    await fetchToDo();
  }

  init() {
    fetchToDo();
    notifyListeners();
  }
}
