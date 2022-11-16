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
        Text(title!, style: Theme.of(context).textTheme.headline6),
        Text(
          DateFormat('dd-MMMM-yyyy').format(date!),
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
