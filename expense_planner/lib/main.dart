import 'package:flutter/material.dart';
import 'dart:math';

import './models/transaction.dart';

import './widgets/chart.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.blueAccent,
        fontFamily: 'Lato',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'Comic_Neue',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Comic_Neue',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];
  bool _buttonPressed = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.time.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      name: title,
      amount: amount,
      time: date,
      id: Random.secure().toString(),
    );
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(int index) {
    setState(() {
      _userTransactions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text('Expense Planner'),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    );

    final isLandscape =
        mediaQuery.orientation == Orientation.landscape;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: !isLandscape
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Chart(_recentTransactions),
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.3,
                  ),
                  Container(
                    child:
                        TransactionList(_userTransactions, _deleteTransaction),
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.7,
                  ),
                ],
              )
            : Column(
                children: <Widget>[
                  Container(
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buttonPressed
                            ? Text('Switch to Chart: ')
                            : Text('Switch to Transactions List: '),
                        Switch(
                          value: _buttonPressed,
                          onChanged: (v) {
                            setState(() {
                              _buttonPressed = v;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  _buttonPressed
                      ? Container(
                          child: Chart(_recentTransactions),
                          height: (mediaQuery.size.height -
                                  appBar.preferredSize.height -
                                  mediaQuery.padding.top) *
                              0.8,
                        )
                      : Container(
                          child: TransactionList(
                              _userTransactions, _deleteTransaction),
                          height: (mediaQuery.size.height -
                                  appBar.preferredSize.height -
                                  mediaQuery.padding.top) *
                              0.8,
                        ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

// List<Transaction> transactions = [
//   Transaction(
//     id: 'aev',
//     name: 'aevfae',
//     amount: 2421,
//     time: DateTime.now(),
//   ),
//   Transaction(
//     id: 'aev',
//     name: 'aevfae',
//     amount: 2421,
//     time: DateTime.now(),
//   ),
// ];
// Column(
//       children: <Widget>[
//         NewTransaction(_addNewTransaction),
//         TransactionList(_userTransactions),
//       ],
//     ),
// import './widgets/user_transaction.dart';
// Transaction(
//   id: 'aev',
//   name: 'aevfae',
//   amount: 2421,
//   time: DateTime.now(),
// ),
// Transaction(
//   id: 'awegvwegvv',
//   name: 'aaveave',
//   amount: 221,
//   time: DateTime.now(),
// ),

  // void _onOrientationChange(bool value) {
  //   setState(() {
  //     _buttonPressed = value;
  //   });
  // }

