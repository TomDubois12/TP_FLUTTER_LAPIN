import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Entrez votre nom pour jouer',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Confirmer mon nom'),
              onPressed: () => context.go('/home/name/level'),
            ),
          ],
        ),
      ),
    );
  }
}
