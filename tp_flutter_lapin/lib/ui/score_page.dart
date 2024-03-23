import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vos scores'),
      ),
      body: Center(
        child: Text(
          'Contenu de la page des scores',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
