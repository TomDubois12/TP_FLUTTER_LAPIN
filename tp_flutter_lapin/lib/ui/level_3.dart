import 'package:flutter/material.dart';

class Niveau3Screen extends StatelessWidget {
  const Niveau3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level 3'),
      ),
      body: Center(
        child: Text(
          'Contenu de la page Niveau 3',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
