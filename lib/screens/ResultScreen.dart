import 'package:flutter/material.dart';

import 'RankingScreen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int timeTaken;

  ResultScreen({@required this.score, @required this.timeTaken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your score: $score'),
            SizedBox(height: 20),
            Text('Time taken: $timeTaken'),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                // Reset the quiz and navigate back to the home screen
                Navigator.pop(context);
              },
              child: Text('Play Again'),
            ),
            RaisedButton(
              onPressed: () {
                // Navigate to the ranking screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RankingScreen(),
                  ),
                );
              },
              child: Text('Ranking'),
            ),
          ],
        ),
      ),
    );
  }
}