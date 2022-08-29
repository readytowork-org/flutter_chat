import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("chat")
          .orderBy(
            "created_at",
            descending: true,
          )
          .snapshots(),
      builder: (ctx, chatSnapShot) {
        if (chatSnapShot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final document = chatSnapShot.data!.docs;
        return ListView.builder(
          reverse: true,
          itemBuilder: (ctx, index) => Container(
            padding: const EdgeInsets.all(8),
            child: Text(document[index]['text']),
          ),
          itemCount: document.length,
        );
      },
    );
  }
}
