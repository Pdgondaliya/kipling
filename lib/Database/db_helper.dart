import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'db_data.dart';

class DatabaseHelper {
  static const _databaseName = "kipling.db";
  static const _databaseVersion = 1;

  static const table = 'kipling_table';

  static const columnId = 'id';
  static const columnTitle = 'jsonString';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY ,
            $columnTitle TEXT
          )
          ''');
  }

  Future<int> insert(Todo todo) async {
    Database? db = await instance.database;
    var res = await db!.insert(table, todo.toMap());

    print('Table: $res');
    return res;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    var res = await db!.query(table, orderBy: "$columnId DESC");
    return res;
  }

  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Todo toda) async {
    Database? db = await instance.database;
    var dbClient = await db;
    return await dbClient!.update(
      table,
      toda.toMap(),
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  Future<int?> tableIsEmpty() async {
    Database? db = await instance.database;
    var res = await Sqflite?.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $table'));
    return res;
  }

  Future<bool> databaseExists(String path) =>
      databaseFactory.databaseExists(path);
}
// DatabaseHelper.instance.queryAllRows().then((value) {
//       setState(() {
//         value.forEach((element) {
//           taskList.add(Todo(id: element['id'], jsonString: element["jsonString"]));
//         });
//       });
//     }).catchError((error) {
//       print(error);
//     });