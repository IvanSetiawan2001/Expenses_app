import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Models/transaction.dart';
import 'package:intl/intl.dart';
import '../Widgets/Price.dart';
import '../Widgets/TxDesc.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function deleteTx;
  TransactionList(this._userTransaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: _userTransaction.isEmpty
          ? LayoutBuilder(builder: (ctx, constraint) {
              return Column(
                children: [
                  Text(
                    'No transaction added yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: constraint.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            })
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
                    trailing: MediaQuery.of(context).size.width > 460
                        ? TextButton.icon(
                            onPressed: () =>
                                deleteTx(_userTransaction[index].id),
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).errorColor,
                            ),
                            label: Text('Delete'),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                  Theme.of(context).errorColor),
                            ),
                          )
                        : IconButton(
                            onPressed: () =>
                                deleteTx(_userTransaction[index].id),
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                          ),
                  ),
                );
              },

              itemCount: _userTransaction.length,
              //tx is just a random name
            ),
    );
  }
}
