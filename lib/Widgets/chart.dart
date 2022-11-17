import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Models/transaction.dart';
import 'package:flutter_complete_guide/Widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      //generate a list with 7 item
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

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
  }

  double get totalSpending {
    return groupedTransactionValues.fold(
        0.0, (sum, item) => sum + (item['amount'] as double));
    //fold allow us to change a list to another type with a certain logic we define that we passed to fold
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              flex: 1,
              //flex is indicate the portion a component will get, for example if one is 1 and the other is 2, the 2nd will get twice the space of the first one
              fit: FlexFit.tight,
              child: ChartBar(
                label: (data['day'] as String),
                spendingAmount: (data['amount'] as double),
                spendingPcOfTotal: totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
