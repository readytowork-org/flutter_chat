import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, i) => const Text("This works"),
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        child: const  Icon(Icons.add),
        onPressed: () {

         FirebaseFirestore.instance.collection("chats/fQGuf35u8BNIOKLzBP0n")
         .snapshots().listen((data) {
            print(data);
          });
      },),
    );
  }
}
