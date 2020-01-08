import 'package:bogactwo/widgets/new_transaction.dart';

import './widgets/transcation_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

// importuje wszystkie NIE PRYWATNE propsy
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
        
        // appBarTheme: Colors.deepOrange
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
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: "piwko",
      amount: 9.99,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTx(BuildContext ctx) {
    showModalBottomSheet(
        //straszne zamieszanie z tymi contextami, w bulderze tez byl bCtx ;)
        context: ctx,
        builder: (_) {
          return NewTransaction(_addTransaction);
          // GestureDetector(
          //   onTap: (){},
          //   child: NewTransaction(_addTransaction),
          //   behavior: HitTestBehavior.opaque,
          //   );
        });
  }

  @override
  Widget build(BuildContext context) { //context podajemy nizej w metodzie _startAddNewTx
    return Scaffold(
      appBar: AppBar(
        title: Text("Bogactwa"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add), onPressed: () => _startAddNewTx(context))
        ],
      ),
      body: SingleChildScrollView(
        //dodaje nam opcje scroll do Column, mozemy zrobic tez to w elemencie Column w usertransaction
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
            ),
            // UserTransactions(),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTx(context),
      ),
    );
  }
}
