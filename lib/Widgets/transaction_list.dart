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
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Price(_userTransaction[index].amount),
                TxDesc(
                  title: _userTransaction[index].title,
                  date: _userTransaction[index].date,
                )
              ],
            ),
          );
        },

        itemCount: _userTransaction.length,
        //tx is just a random name
      ),
    );
  }
}
