import 'package:flutter/foundation.dart';
class Transaction {
  @required String id;
  @required String name;
  @required double amount;
  @required DateTime time;
  Transaction({
    this.id,
    this.name,
    this.amount,
    this.time,
  });
}
