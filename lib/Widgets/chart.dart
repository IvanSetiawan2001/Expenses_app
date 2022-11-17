import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      print(
          'masuk & recentTransactions. length = ${recentTransactions.length}');
      for (int a = 0; a < recentTransactions.length; a++) {
        if (recentTransactions[a].date!.day == weekDay.day &&
            recentTransactions[a].date!.month == weekDay.month &&
            recentTransactions[a].date!.year == weekDay.year) {
          totalSum += recentTransactions[a].amount!;
        }
      }

      print(DateFormat('dd-MMMM-yyyy').format(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
    //generate a list with 7 item
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return Text('${data['day']}:${data['amount']}');
        }).toList(),
      ),
    );
  }
}
