import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => FirebaseAuth.instance.signOut(),
        child: Container(
          color: Colors.purpleAccent,
        ),
      ),
    );
  }
}
