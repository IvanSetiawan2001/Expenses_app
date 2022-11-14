import 'package:flutter/material.dart';

class TxDesc extends StatelessWidget {
  final String? title;
  final DateTime? date;

  TxDesc({this.title, this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          date!.toString(),
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
