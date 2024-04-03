import 'package:flutter/material.dart';
import 'app.dart';
import 'database/database_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseService().initialize(); // Initialise la factory de base de données
  runApp(const MyApp());
}
