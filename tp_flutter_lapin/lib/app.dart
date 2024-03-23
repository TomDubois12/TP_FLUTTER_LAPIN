import 'package:flutter/material.dart';
import 'package:tp_flutter_lapin/router/app_router.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Le jeu du lapin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }

}