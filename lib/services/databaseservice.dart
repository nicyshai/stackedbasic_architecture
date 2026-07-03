import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/category.dart';

class Databaseservice {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), "todo.db"),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, catid INTEGER, date TEXT, time TEXT, priority TEXT, iscompleted INTEGER)",
        );
      },
    );
  }

  Future<int> insertTask(Task task) async {
    final db = await database;
    return await db.insert("tasks", task.toMap());
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return await db.update("tasks", task.toMap(), where: "id = ?", whereArgs: [task.id]);
  }

  Future<List<Task>> getTask() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("tasks");
    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete("tasks", where: "id = ?", whereArgs: [id]);
  }
}
