import 'package:flutter/material.dart';

class Niveau2Screen extends StatelessWidget {
  const Niveau2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level 2'),
      ),
      body: Center(
        child: Text(
          'Contenu de la page Niveau 2',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
