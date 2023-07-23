// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_task_app/model/taskmodel.dart';
import 'package:sqflite/sqflite.dart';

class TaskProvider {
  late Database database;
  final int _version = 1;
  final String _dbName = "todo";
  String columnId = 'id';
  String columnHeader = 'header';
  String columnContent = 'content';
  void open() async {
    database = await openDatabase(
      _dbName,
      version: _version,
      onCreate: (db, version) {
        cretaTodoTable(db);
      },
    );
  }

  void cretaTodoTable(Database db) {
    db.execute(
        'CREATE TABLE todo($columnId INTEGER PRIMARY KEY AUTOINCREMENT,$columnHeader VARCHAR(20),$columnContent VARCHAR(20))');
  }

  Future<List<TaskModel>> getList() async {
    if (database != null) open();
    List<Map<String, dynamic>> maps = await database.query(_dbName);
    return maps.map((e) => TaskModel.fromJson(e)).toList();
  }

  Future<TaskModel?> getItem(int id) async {
    if (database != null) open();
    final maps = await database.query(
      _dbName,
      where: '$columnId=?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return TaskModel.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<bool> deleteItem(int id) async {
    if (database != null) open();
    final maps = await database.delete(
      _dbName,
      where: '$columnId=?',
      whereArgs: [id],
    );
    return maps != null;
  }

  Future<bool> updateItem(int id, TaskModel model) async {
    if (database != null) open();
    final maps = await database.update(
      _dbName,
      model.toJson(),
      where: '$columnId=?',
      whereArgs: [id],
    );
    return maps != null;
  }

  Future<void> close() async {
    return database.close();
  }

  Future<bool> insertItem(TaskModel model) async {
    if (database != null) open();
    final maps = await database.insert(_dbName, model.toJson());
    return maps != null;
  }
}
