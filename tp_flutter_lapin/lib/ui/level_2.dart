import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:go_router/go_router.dart';

import '../database/score_db.dart';
import '../dialogues/congratulationsDialog.dart';
import '../dialogues/failDialog.dart';

class Niveau2Screen extends StatefulWidget {
  const Niveau2Screen({Key? key}) : super(key: key);

  @override
  _Niveau2ScreenState createState() => _Niveau2ScreenState();
}

class _Niveau2ScreenState extends State<Niveau2Screen> {
  int _indexLapin = Random().nextInt(4);
  int _taupe = 0;
  int _lapin = 0;
  double _score = 0;
  Stopwatch _stopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    _stopwatch.start();
  }

  void gererTape(int index) {
    if (_indexLapin == index) {
      _lapin++;
      if (_lapin == 15) {
        _stopwatch.stop();
        _showCongratulationsDialog(_taupe);
      } else {
        _indexLapin = Random().nextInt(4);
      }
    } else {
      _taupe++;
      if (_taupe == 10) {
        _showFailsDialog();
      }
    }
    setState(() {});
  }

  // Fonction pour calculer le score
  double calculerScore(int tempsEcoule) {
    // Calcul du score en utilisant la formule
    double score = (_lapin * 50) - (_taupe * 75) - (tempsEcoule * 4);

    // Assurez-vous que le score est toujours positif
    return score >= 0 ? score : 0;
  }

  Future<void> _showCongratulationsDialog(int nbTaupe) async {
    double score = calculerScore(_stopwatch.elapsed.inSeconds);
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CongratulationsDialog(
          nbTaupe: nbTaupe,
          score: score,
          stopwatch: _stopwatch,
          onSaveScore: _saveScore,
        );
      },
    );
  }

  void _saveScore(String playerName, double score) async {
    // Ajoutez des logs pour afficher les informations pertinentes
    print('Nom du joueur: $playerName');
    print('Niveau: 2'); // Niveau actuel
    print('Score: $_score'); // Score du joueur

    try {
      // Enregistrez le nom, le niveau et le score dans la base de données
      await ScoreDB().create(niveau: 2, name: playerName, score: score.toInt());
      print('Score enregistré avec succès dans la base de données');
    } catch (e) {
      print('Erreur lors de l\'enregistrement du score: $e');
    }
  }

  Future<void> _showFailsDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return FailDialog(
          nbTaupe: _taupe,
          niveau: 1, // Ajoutez le niveau ici
          onRetry: () {
            setState(() {
              _lapin = 0;
              _taupe = 0;
              _indexLapin = Random().nextInt(2);
              _stopwatch.reset();
              _stopwatch.start();
            });
            Navigator.of(context).pop();
          },
          onReturnToMenu: () {
            context.go('/home');
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var b0 = MaterialButton(
      onPressed: () {
        gererTape(0);
      },
      child: Image.asset(
        _indexLapin == 0 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 100,
        height: 100,
      ),
    );
    var b1 = MaterialButton(
      onPressed: () {
        gererTape(1);
      },
      child: Image.asset(
        _indexLapin == 1 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 100,
        height: 100,
      ),
    );
    var b2 = MaterialButton(
      onPressed: () {
        gererTape(2);
      },
      child: Image.asset(
        _indexLapin == 2 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 100,
        height: 100,
      ),
    );
    var b3 = MaterialButton(
      onPressed: () {
        gererTape(3);
      },
      child: Image.asset(
        _indexLapin == 3 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 100,
        height: 100,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le jeu du lapin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Niveau 2',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Lapin(s): $_lapin",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Text(
                  "Taupe(s): $_taupe",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                )
              ],
            ),
            const Text(
              'Touche le plus rapidement 15 lapins',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b0,
                b1,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b2,
                b3,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
