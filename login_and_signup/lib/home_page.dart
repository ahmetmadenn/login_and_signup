import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(backgroundColor: Colors.grey[500], actions: <Widget>[
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout)),
        ]),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Logged in as ${users?.email}',
                  style: const TextStyle(fontSize: 20)),
            ],
          ),
        )));
  }
}
