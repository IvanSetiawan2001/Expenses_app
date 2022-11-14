import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          DateFormat('dd-MMMM-yyyy').format(date!),
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
