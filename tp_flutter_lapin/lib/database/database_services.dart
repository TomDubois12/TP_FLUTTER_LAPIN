import 'package:sqflite_common/sqflite.dart';
import 'package:path/path.dart';
import 'package:tp_flutter_lapin/database/score_db.dart';

class DatabaseService {
  Database? _database;

  // Méthode pour initialiser la base de données
  Future<void> init() async {
    _database = await initialize();
  }

  // Méthode pour obtenir le chemin complet de la base de données
  Future<String> get fullPath async {
    const name = 'score.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  // Méthode pour initialiser la base de données
  Future<Database> initialize() async {
    final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  // Méthode pour créer la table dans la base de données
  Future<void> create(Database database, int version) async =>
      await ScoreDB().createTable(database);

  // Méthode pour obtenir la base de données
  Future<Database> get database async {
    // Vérifie si la base de données a déjà été initialisée
    if (_database != null) {
      return _database!;
    }
    // Sinon, initialise la base de données
    await init();
    return _database!;
  }
}
