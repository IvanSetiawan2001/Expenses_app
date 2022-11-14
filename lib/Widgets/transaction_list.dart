import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Models/transaction.dart';
import '../Widgets/Price.dart';
import '../Widgets/TxDesc.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;

  TransactionList(this._userTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        children: _userTransaction.map((tx) {
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
      ),
    );
  }
}
