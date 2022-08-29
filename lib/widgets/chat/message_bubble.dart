import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String? message;
  const MessageBubble(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.secondary,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            message!,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}
