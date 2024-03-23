import 'package:flutter/material.dart';

class Niveau1Screen extends StatelessWidget {
  const Niveau1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level 1'),
      ),
      body: Center(
        child: Text(
          'Contenu de la page Niveau 1',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
