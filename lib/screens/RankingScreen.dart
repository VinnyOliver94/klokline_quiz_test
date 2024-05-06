import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  final String quizId;

  RankingScreen({this.quizId});

  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  Stream<QuerySnapshot> _rankingsStream;

  @override
  void initState() {
    super.initState();
    _rankingsStream = FirebaseFirestore.instance
        .collection('quizzes')
        .doc(widget.quizId)
        .collection('rankings')
        .orderBy('score')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rankings'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _rankingsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return ListTile(
                title: Text(document.data()['name']),
                subtitle: Text('Score: ${document.data()['score']}'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}