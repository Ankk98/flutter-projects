import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    'Rs ${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      transactions[index].name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      DateFormat.jm()
                          .add_yMMMd()
                          .format(transactions[index].time),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ],
            ),
            color: Theme.of(context).cardColor,
          );
        },
      ),
    );
  }
}

// Column(
//       children: transactions.map((transaction) {
//         return Card(
//           child: Row(
//             children: <Widget>[
//               Container(
//                 child: Text(
//                   'Rs ${transaction.amount}',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red[400],
//                   ),
//                 ),
//                 margin: EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 10,
//                 ),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.red[400],
//                     width: 2,
//                   ),
//                 ),
//                 padding: EdgeInsets.all(10),
//               ),
//               Column(
//                 children: <Widget>[
//                   Text(
//                     transaction.name,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                   Text(
//                     DateFormat.jm().add_yMMMd().format(transaction.time),
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.blueGrey,
//                     ),
//                   ),
//                 ],
//                 crossAxisAlignment: CrossAxisAlignment.start,
//               ),
//             ],
//           ),
//           color: Colors.greenAccent,
//         );
//       }).toList(),
//       crossAxisAlignment: CrossAxisAlignment.center,
//     )
