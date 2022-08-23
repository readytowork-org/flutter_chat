import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("chats/R2M0dLKRhaLgsUkzqjgp/messages")
          .snapshots(),
      builder: (ctx, streamSnapShot) {
        if (streamSnapShot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final document = streamSnapShot.data?.docs;
        return ListView.builder(
          itemBuilder: (ctx, index) => Container(
            padding: const EdgeInsets.all(8),
            child: Text(document![index]['text']),
          ),
          itemCount: document!.length,
        );
      },
    ));
  }
}
