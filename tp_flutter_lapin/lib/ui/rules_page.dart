import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Règles du jeu'),
      ),
      body: Center(
        child: Text(
          'Contenu de la page des rules',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
