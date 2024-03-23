import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Niveau1Screen extends StatelessWidget {
  const Niveau1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenue au niveau 1 !',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Retournez au menu'),
            ),
          ],
        ),
      ),
    );
  }
}
