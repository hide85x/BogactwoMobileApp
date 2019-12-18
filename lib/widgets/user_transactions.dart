import 'package:flutter/material.dart';
import './new_transaction.dart';

import './transcation_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

    final List<Transaction> _userTransactions= [
     Transaction(
      id: 't1',
      title: "piwko",
      amount: 9.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: "rybka",
      amount: 2.29,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}
