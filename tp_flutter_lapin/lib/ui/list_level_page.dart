import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LevelsScreen extends StatelessWidget{
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Les niveaux disponibles'),),
      body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('Niveau 1'),
                onPressed: () => context.go('/home/level/1'),
              ),
              ElevatedButton(
                child: const Text('Niveau 2'),
                onPressed: () => context.go('/home/level/2'),
              ),
              ElevatedButton(
                child: const Text('Niveau 3'),
                onPressed: () => context.go('/home/level/3'),
              ),
              ElevatedButton(
                child: const Text('Niveau 4'),
                onPressed: () => context.go('/home/name/level/4'),
              ),
            ],
          )
      ),
    );
  }
}