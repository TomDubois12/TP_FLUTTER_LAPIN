import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';


import 'package:go_router/go_router.dart';

class Niveau4Screen extends StatefulWidget {
  const Niveau4Screen({Key? key}) : super(key: key);

  @override
  _Niveau4ScreenState createState() => _Niveau4ScreenState();
}

class _Niveau4ScreenState extends State<Niveau4Screen> {
  int randomNumber4Image = Random().nextInt(2);
  int _indexLapin = Random().nextInt(9);
  int _taupe = 0;
  int _lapin = 0;
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch.start();

    // _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   setState(() {
    //     _indexLapin = Random().nextInt(9);
    //   });
    // });
  }

  String get imagePath0 {
    if (randomNumber4Image == 0) {
      return 'assets/taupe.png';
    } else {
      return 'assets/lapin_inverse.png';
    }
  }

  String get imagePath1 {
    if (randomNumber4Image == 0) {
      return 'assets/lapin_inverse.png';
    } else {
      return 'assets/lapin_noir.png';
    }
  }

  String get imagePath2 {
    if (randomNumber4Image == 0) {
      return 'assets/lapin_noir.png';
    } else {
      return 'assets/taupe_inverse.png';
    }
  }

  String get imagePath3 {
    if (randomNumber4Image == 0) {
      return 'assets/taupe_inverse.png';
    } else {
      return 'assets/Logo.png';
    }
  }

  void gererTape(int index) {

    if (_indexLapin == index) {
      _lapin++;
      if (_lapin == 15) {
        _stopwatch.stop();
        // _timer.cancel();
        _showCongratulationsDialog();
      } else {
        randomNumber4Image = Random().nextInt(2);
        _indexLapin = Random().nextInt(9);
      }
    } else {
      _taupe++;
      if (_taupe == 5) {
        _showFailsDialog();
      }
    }
    setState(() {});
  }

  Future<void> _showCongratulationsDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bravo!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Vous avez touché 15 lapins en ${_stopwatch.elapsed
                    .inSeconds} secondes.'),
                const Text('Retournez au menu pour consulter vos scores')
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Retournez au menu'),
              onPressed: () => context.go('/home'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showFailsDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dommage !'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Vous avez touché 5 taupes.'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Recommencer le niveau'),
              onPressed: () {
                setState(() {
                  _lapin = 0;
                  _taupe = 0;
                  randomNumber4Image = Random().nextInt(2);
                  _indexLapin = Random().nextInt(9);
                  _stopwatch.reset();
                  _stopwatch.start();
                });
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Retournez au menu'),
              onPressed: () => context.go('/home'),
            ),
          ],
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
        _indexLapin == 0 ? 'assets/lapin.png' : imagePath0,
        width: 75,
        height: 75,
      ),
    );

    var b1 = MaterialButton(
      onPressed: () {
        gererTape(1);
      },
      child: Image.asset(
        _indexLapin == 1 ? 'assets/lapin.png' : imagePath2,
        width: 75,
        height: 75,
      ),
    );
    var b2 = MaterialButton(
      onPressed: () {
        gererTape(2);
      },
      child: Image.asset(
        _indexLapin == 2 ? 'assets/lapin.png' : imagePath1,
        width: 75,
        height: 75,
      ),
    );
    var b3 = MaterialButton(
      onPressed: () {
        gererTape(3);
      },
      child: Image.asset(
        _indexLapin == 3 ? 'assets/lapin.png' : imagePath3,
        width: 75,
        height: 75,
      ),
    );
    var b4 = MaterialButton(
      onPressed: () {
        gererTape(4);
      },
      child: Image.asset(
        _indexLapin == 4 ? 'assets/lapin.png' : imagePath0,
        width: 75,
        height: 75,
      ),
    );
    var b5 = MaterialButton(
      onPressed: () {
        gererTape(5);
      },
      child: Image.asset(
        _indexLapin == 5 ? 'assets/lapin.png' : imagePath2,
        width: 75,
        height: 75,
      ),
    );
    var b6 = MaterialButton(
      onPressed: () {
        gererTape(6);
      },
      child: Image.asset(
        _indexLapin == 6 ? 'assets/lapin.png' : imagePath0,
        width: 75,
        height: 75,
      ),
    );
    var b7 = MaterialButton(
      onPressed: () {
        gererTape(7);
      },
      child: Image.asset(
        _indexLapin == 7 ? 'assets/lapin.png' : imagePath3,
        width: 75,
        height: 75,
      ),
    );
    var b8 = MaterialButton(
      onPressed: () {
        gererTape(8);
      },
      child: Image.asset(
        _indexLapin == 8 ? 'assets/lapin.png' : imagePath2,
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
              'Niveau 4',
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