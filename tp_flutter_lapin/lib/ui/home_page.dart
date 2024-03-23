import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page d\'accueil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Logo.png',
              width: 400,
              height: 400,
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                ElevatedButton(
                  child: const Text('Jouer'),
                  onPressed: () => context.go('/home/name'),
                ),
                ElevatedButton(
                  child: const Text('Scores'),
                  onPressed: () => context.go('/home/score'),
                ),
                ElevatedButton(
                  child: const Text('Règles du jeu'),
                  onPressed: () => context.go('/home/rules'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
