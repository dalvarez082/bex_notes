import 'dart:async';
import 'package:bex_notes/core/database/tables/note_table.dart';
import 'package:bex_notes/core/database/tables/note_tag_table.dart';
import 'package:bex_notes/core/database/tables/tag_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'tables/user_table.dart';

class DatabaseHelper {
  static const _dbName = 'bex_notes.db';
  static const _dbVersion = 1;

  static final DatabaseHelper instance = DatabaseHelper._internal();
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(UserTable.createTable);
  await db.execute(NoteTable.createTable);
  await db.execute(TagTable.createTable);
  await db.execute(NoteTagTable.createTable);
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
