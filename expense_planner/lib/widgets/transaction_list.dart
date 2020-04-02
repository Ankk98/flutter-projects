import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTranasction;
  TransactionList(this.transactions, this.deleteTranasction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: transactions.length < 1
          ? Column(
              children: <Widget>[
                Text('Add a new Transaction'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/welcome2.png',
                    fit: BoxFit.cover,
                  ),
                  height: 200,
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            'Rs ${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].name,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.jm()
                          .add_yMMMd()
                          .format(transactions[index].time),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteTranasction(index),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
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
// //     )
// TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),

// Card(
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         child: Text(
//                           'Rs ${transactions[index].amount.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).primaryColor,
//                           ),
//                         ),
//                         margin: EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 10,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Theme.of(context).primaryColor,
//                             width: 2,
//                           ),
//                         ),
//                         padding: EdgeInsets.all(10),
//                       ),
//                       Column(
//                         children: <Widget>[
//                           Text(
//                             transactions[index].name,
//                             style: Theme.of(context).textTheme.title,
//                             textAlign: TextAlign.left,
//                           ),
//                           Text(
//                             DateFormat.jm()
//                                 .add_yMMMd()
//                                 .format(transactions[index].time),
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.blueGrey,
//                             ),
//                           ),
//                         ],
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                       ),
//                     ],
//                   ),
//                   color: Theme.of(context).cardColor,
//                 );

// style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Theme.of(context).primaryColor,
//                             )
// textAlign: TextAlign.left,
// textAlign: TextAlign.left,
// style: TextStyle(
//   fontSize: 14,
//   color: Colors.blueGrey,
// ),
