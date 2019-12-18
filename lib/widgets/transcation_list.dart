import 'package:bogactwo/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// wszytskie statowe rzeczy robimy w userTransactions wiec zmieniamy ta klase na stateless
class TransactionList extends StatelessWidget {

final List<Transaction> transactions ;

TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: transactions.map((tx) {
              return Card(
                margin: EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        margin:
                            EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            color: Colors.white),
                        child: Text('\$${tx.amount}', //tx.amount.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: Colors.blue)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(tx.title,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w600)),
                          ),
                          Text(DateFormat.yMMMEd().format(tx.date),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey))
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          );
  }
}