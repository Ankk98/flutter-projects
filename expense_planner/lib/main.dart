import 'dart:math';

import 'package:flutter/material.dart';

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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
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

  @override
  void initState(){
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    print(state);
  }
  
  @override
  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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

  Widget _buildLandscapeContent(MediaQueryData mediaQuery, AppBar appBar) {
    return Column(
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
                  ? const Text('Switch to Chart: ')
                  : const Text('Switch to Transactions List: '),
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
                child: TransactionList(_userTransactions, _deleteTransaction),
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.8,
              ),
      ],
    );
  }

  Widget _buildPortraitContent(MediaQueryData mediaQuery, AppBar appBar) {
    return Column(
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
          child: TransactionList(_userTransactions, _deleteTransaction),
          height: (mediaQuery.size.height -
                  appBar.preferredSize.height -
                  mediaQuery.padding.top) *
              0.7,
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
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
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final appBar = _buildAppBar();

    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: isLandscape
              ? _buildLandscapeContent(mediaQuery, appBar)
              : _buildPortraitContent(mediaQuery, appBar),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(
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
