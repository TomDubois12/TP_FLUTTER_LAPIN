import 'package:sqflite_common/sqflite.dart';
import 'package:tp_flutter_lapin/database/database_services.dart';
import 'package:tp_flutter_lapin/database/score_db.dart';

import '../model/score.dart';

class ScoreDB{
  final tableName = "scores";

  Future<void> createTable(Database database) async{
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    "id" INTEGER NOT NULL,
    "niveau" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "score" INTEGER NOT NULL,
    PRIMARY KEY("id" AUTOINCREMENT)
    );"""
    );
  }

  Future<int> create({required int niveau, required String name, required int score}) async{
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (niveau, name, score) VALUES (?,?,?)''',
      [niveau, name, score],
    );
  }

  Future<List<Score>> fetchAll() async{
    final database = await DatabaseService().database;
    final scores = await database.rawQuery(
      '''SELECT * from $tableName ORDER BY score DESC;''');
    return scores.map((score) => Score.fromSqfliteDatabase(score)).toList();
  }

  Future<Score> fetchById(int id) async{
    final database = await DatabaseService().database;
    final score = await database.rawQuery(
      '''SELECT * from $tableName WHERE id=?''', [id]);
    return Score.fromSqfliteDatabase(score.first);
  }
}