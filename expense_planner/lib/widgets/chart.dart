import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      var totalSum = 0.0;
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].time.day == weekDay.day &&
            recentTransactions[i].time.month == weekDay.month &&
            recentTransactions[i].time.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalAmountOfWeek{
    var total = 0.0;
    groupedTransactionValues.forEach((data){
      total += (data['amount'] as double);
    });
    
    return total;
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: groupedTransactionValues.map((data){
            double percentage;
            
            if(totalAmountOfWeek == 0.0){
              percentage = 0.0;
            }
            else{
              percentage = (data['amount'] as double) / totalAmountOfWeek;
            }

            return ChartBar(data['day'], data['amount'], percentage);
          }).toList(),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.all(20),
      elevation: 6,
    );
  }
}

// Text(
//         'chart area',
//       ),
// Text('${data['day']} : ${data['amount']}')