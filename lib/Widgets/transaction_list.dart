import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Models/transaction.dart';
import 'package:intl/intl.dart';
import '../Widgets/Price.dart';
import '../Widgets/TxDesc.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;

  TransactionList(this._userTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _userTransaction.isEmpty
          ? Column(
              children: [
                Text(
                  'No transaction added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${_userTransaction[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      _userTransaction[index].title!,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(DateFormat.yMMMd().format(
                      _userTransaction[index].date!,
                    )),
                  ),
                );
              },

              itemCount: _userTransaction.length,
              //tx is just a random name
            ),
    );
  }
}
