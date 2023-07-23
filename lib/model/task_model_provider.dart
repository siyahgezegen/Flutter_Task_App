// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_task_app/model/taskmodel.dart';
import 'package:sqflite/sqflite.dart';

class TaskProvider {
  Database? _database;
  final int _version = 1;
  final String _dbName = "todo";
  String columnId = 'id';
  String columnHeader = 'header';
  String columnContent = 'content';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initialize();
    return _database!;
  }

  Future<Database> _initialize() async {
    var database = await openDatabase(
      _dbName,
      version: _version,
      onCreate: (db, version) {
        cretaTodoTable(db);
      },
    );
    return database;
  }

  Future<void> open() async {}

  void cretaTodoTable(Database db) {
    db.execute(
        'CREATE TABLE todo($columnId INTEGER PRIMARY KEY AUTOINCREMENT,$columnHeader VARCHAR(20),$columnContent VARCHAR(20))');
  }

  Future<List<TaskModel>> getList() async {
    final database = await TaskProvider().database;
    List<Map<String, dynamic>> maps = await database.query(_dbName);
    return maps.map((e) => TaskModel.fromJson(e)).toList();
  }

  Future<TaskModel?> getItem(int id) async {
    final database = await TaskProvider().database;
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
    final database = await TaskProvider().database;
    final maps = await database.delete(
      _dbName,
      where: '$columnId=?',
      whereArgs: [id],
    );
    return maps != null;
  }

  Future<bool> updateItem(int id, TaskModel model) async {
    final database = await TaskProvider().database;
    final maps = await database.update(
      _dbName,
      model.toJson(),
      where: '$columnId=?',
      whereArgs: [id],
    );
    return maps != null;
  }

  Future<bool> insertItem(TaskModel model) async {
    final database = await TaskProvider().database;
    final maps = await database.insert(_dbName, model.toJson());
    return maps != null;
  }
}
