import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CongratulationsDialog extends StatelessWidget {
  final int nbTaupe;
  final double score;
  final Stopwatch stopwatch;
  final Function(String playerName, double score) onSaveScore;

  const CongratulationsDialog({
    Key? key,
    required this.nbTaupe,
    required this.score,
    required this.stopwatch,
    required this.onSaveScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return AlertDialog(
      title: const Text('Bravo!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Vous avez touché 15 lapins en ${stopwatch.elapsed.inSeconds} secondes. ($nbTaupe taupe(s) ont été touchée(s). Votre score est de : ${score}'),
            const Text('Entrez votre nom :'),
            TextField(controller: nameController),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Retournez au menu'),
          onPressed: () {
            String playerName = nameController.text.trim();
            onSaveScore(playerName, score);
            context.go('/home');
          },
        ),
      ],
    );
  }
}
