import 'package:flutter/cupertino.dart';

class Transaction {
  String? id;
  String? title;
  double? amount;
  DateTime? date;

  Transaction({
      @required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});

  String? get getId {
    return this.id;
  }

  String? get getTitle {
    return this.title;
  }

  double? get getAmount {
    return this.amount;
  }

  DateTime? get getDate {
    return this.date;
  }
}
