import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Price.dart';
import 'package:flutter_complete_guide/TxDesc.dart';

import 'package:flutter_complete_guide/transaction.dart';

class TxCard extends StatelessWidget {
  final List<Transaction>? transactions;

  TxCard({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions!.map((tx) {
        return Card(
          child: Row(
            children: [
              Price(tx.amount),
              TxDesc(
                title: tx.title,
                date: tx.date,
              )
            ],
          ),
        );
      }).toList(),
      //tx is just a random name
    );
  }
}
