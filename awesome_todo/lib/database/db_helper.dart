import 'package:awesome_todo/database/todojson_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final _databaseName = 'todoApp.db';
  static String todoTableName = 'todoTableName';

  // Table for todo
  String todoTable = '''
  CREATE TABLE IF NOT EXISTS $todoTableName (
    todoID INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    content TEXT,
    isCompleted INTEGER
  )
   ''';

  // Database Connection
  Future<Database> initDB() async {
    final databasePath = await getApplicationDocumentsDirectory();
    final path = "${databasePath.path}/$_databaseName";
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(todoTable);
      },
    );
  }

  //CRUD Methods
  // Get ToDo
  Future<List<ToDo>> getToDo() async {
    final db = await initDB();
    final List<Map<String, Object?>> result = await db.query(todoTableName);
    return result.map((e) => ToDo.fromJson(e)).toList();
  }

  // Add new ToDo
  Future<void> addToDo(ToDo todo) async {
    final db = await initDB();
    db.insert(todoTableName, todo.toJson());
  }

  //Update ToDo
  Future<void> updateToDo(ToDo todo) async {
    final db = await initDB();
    db.update(
      todoTableName,
      todo.toJson(),
      where: "todoId = ?",
      whereArgs: [todo.todoId],
    );
  }

  //Delete ToDo
  Future<void> deleteToDo(int id) async {
    final db = await initDB();
    db.delete(
      todoTableName,
      where: "todoId = ?",
      whereArgs: [id],
    );
  }
}
