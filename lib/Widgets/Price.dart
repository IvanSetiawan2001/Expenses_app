import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  final double? amount;

  Price(this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(
        color: Theme.of(context).primaryColor,
        width: 2,
        style: BorderStyle.solid,
      )),
      child: Text(
        '\$' + amount!.toStringAsFixed(2),
        // '\$ ${amount.toString()}' (this is another way to call the amount $ mean interpolaring some value so you can call the variable inside a string)
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
