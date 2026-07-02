import 'dart:math';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/category.dart';

class  Databaseservice {
  Database ? _database;
  Future<void> initDb() async {
    _database=await openDatabase(join(await getDatabasesPath(),"todo.db"),
      version: 1,
      onCreate: (db,version) async {
      await db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,description TEXT,catid INTEGER,date TEXT,time TEXT,priority TEXT,iscompleted BOOLEAN)",
      );

      }

    );
  }
  Future<int?> insertTask(Task task) async {
    await initDb();
    return await _database?.insert("task", task.toMap());
  }
  Future<int?> updateTask(Task task) async {
    return await _database?.update("task", task.toMap(), where: "id=?", whereArgs: [task.id]);
  }
  Future<List<Task>> getTask() async {
    await initDb();
    final data=await _database?.query("task");
    return data!.map((e)=>Task.fromMap(e)).toList();
  }
  Future<int?> deleteTask(int id) async {
    await initDb();
    return await _database?.delete("task", where: "id=?", whereArgs: [id]);
  }
  }
