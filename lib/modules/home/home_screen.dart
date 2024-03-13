import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await FirebaseFirestore.instance.collection('users').add({
          "name":"nehal"
        }).then((value) => print('done')).catchError((error){print(error.toString());});

      },child: Icon(Icons.add)),
    );
  }
}