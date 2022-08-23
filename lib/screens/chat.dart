import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, i) => const Text("This works"),
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Firebase.initializeApp();
          FirebaseFirestore.instance
              .collection("chats/R2M0dLKRhaLgsUkzqjgp/messages")
              .snapshots()
              .listen((data) {
            // inspect(data.docs[0]['text']);
            data.docs.forEach((item) {
              print(item['text']);
             });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
