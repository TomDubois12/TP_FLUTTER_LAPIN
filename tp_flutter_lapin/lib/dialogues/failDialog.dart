import 'package:flutter/material.dart';

class FailDialog extends StatelessWidget {
  final int nbTaupe;
  final int niveau;
  final Function() onRetry;
  final Function() onReturnToMenu;

  const FailDialog({
    Key? key,
    required this.nbTaupe,
    required this.niveau,
    required this.onRetry,
    required this.onReturnToMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Dommage !'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Vous avez touché $nbTaupe taupes.'),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Recommencer le niveau'),
          onPressed: onRetry,
        ),
        ElevatedButton(
          child: const Text('Retournez au menu'),
          onPressed: onReturnToMenu,
        ),
      ],
    );
  }
}
