import 'package:flutter/material.dart';
import 'package:tp_flutter_lapin/model/score.dart';
import '../database/score_db.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoreScreen> {
  late Future<List<Score>> futureScore;
  final scoreDB = ScoreDB();

  @override
  void initState() {
    super.initState();
    fetchScore();
  }

  void fetchScore() {
    setState(() {
      futureScore = ScoreDB().fetchAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scores',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _showDeleteConfirmationDialog(context),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<Score>>(
          future: futureScore,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'Pas encore de score',
                  style: TextStyle(fontStyle: FontStyle.italic, color: Colors.redAccent),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final score = snapshot.data![index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        score.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Level: ${score.niveau}, Score: ${score.score}',
                        style: TextStyle(color: Colors.red[900]),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmer la suppression'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Êtes-vous sûr de vouloir supprimer tous les scores ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Supprimer'),
              onPressed: () {
                _deleteAllScores(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAllScores(BuildContext context) async {
    await scoreDB.deleteAll();
    Navigator.of(context).pop(); // Dismiss the confirmation dialog
    setState(() {
      futureScore = ScoreDB().fetchAll(); // Refresh the score list
    });
  }
}
