import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/TxCard.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 69.99,
      date: DateTime.now(),
    ),
  ];

  String? titleInput;
  String? amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      onChanged: (value) => titleInput = value,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      onChanged: (value) => amountInput = value,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Add Transaction'),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.purple),
                      ),
                    )
                  ],
                ),
              ),
            ),
            TxCard(
              transactions: transactions,
            )
          ],
        ));
  }
}
