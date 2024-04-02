import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:go_router/go_router.dart';

import '../database/score_db.dart';
import '../dialogues/congratulationsDialog.dart';
import '../dialogues/failDialog.dart';

class Niveau3Screen extends StatefulWidget {
  const Niveau3Screen({Key? key}) : super(key: key);

  @override
  _Niveau3ScreenState createState() => _Niveau3ScreenState();
}

class _Niveau3ScreenState extends State<Niveau3Screen> {
  int _indexLapin = Random().nextInt(9);
  int _taupe = 0;
  int _lapin = 0;
  int _score = 0;
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;

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
        _indexLapin = Random().nextInt(9);
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
    double score = (_lapin * 200) - (_taupe * 200) - (tempsEcoule/100000);
    return double.parse((score).toStringAsFixed(2));
  }

  Future<void> _showCongratulationsDialog(int nbTaupe) async {
    double score = calculerScore(_stopwatch.elapsed.inMicroseconds);
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
    print('Nom du joueur: $playerName');
    print('Niveau 3:'); // Niveau actuel
    print('Score: $_score'); // Score du joueur

    try {
      // Enregistrer le nom, le niveau et le score dans la base de données
      await ScoreDB().create(niveau: 3, name: playerName, score: score.toInt());
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
          niveau: 1,
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
        width: 75,
        height: 75,
      ),
    );
    var b1 = MaterialButton(
      onPressed: () {
        gererTape(1);
      },
      child: Image.asset(
        _indexLapin == 1 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 75,
        height: 75,
      ),
    );
    var b2 = MaterialButton(
      onPressed: () {
        gererTape(2);
      },
      child: Image.asset(
        _indexLapin == 2 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 75,
        height: 75,
      ),
    );
    var b3 = MaterialButton(
      onPressed: () {
        gererTape(3);
      },
      child: Image.asset(
        _indexLapin == 3 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 75,
        height: 75,
      ),
    );
    var b4 = MaterialButton(
      onPressed: () {
        gererTape(4);
      },
      child: Image.asset(
        _indexLapin == 4 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 75,
        height: 75,
      ),
    );
    var b5 = MaterialButton(
      onPressed: () {
        gererTape(5);
      },
      child: Image.asset(
        _indexLapin == 5 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 75,
        height: 75,
      ),
    );
    var b6 = MaterialButton(
      onPressed: () {
        gererTape(6);
      },
      child: Image.asset(
        _indexLapin == 6 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 75,
        height: 75,
      ),
    );
    var b7 = MaterialButton(
      onPressed: () {
        gererTape(7);
      },
      child: Image.asset(
        _indexLapin == 7 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 75,
        height: 75,
      ),
    );
    var b8 = MaterialButton(
      onPressed: () {
        gererTape(8);
      },
      child: Image.asset(
        _indexLapin == 8 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 75,
        height: 75,
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
              'Niveau 3',
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
                b2,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b3,
                b4,
                b5,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b6,
                b7,
                b8,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
