import 'package:flutter/material.dart';
import './transaction.dart'; // importuje wszystkie NIE PRYWATNE propsy

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bogactwo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Bogactwa"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        // domyslnie w columnie bedzie center, to troche jak flex
        children: <Widget>[
          //generalnie relacja rodzic > child jesli idzie o wielkosci elementow, trza uwazac!
          Container(
            // dlatego opakowujemy w container, albo TEXT albo CARD
            // size of card depends of its child , a text depends on card
            //gupia sprawa,  zaleznosc font size : card od child i child od text, bledne kolo
            //kombinowac trzeba z opakowawywaniem elementow w containery
            width: double.infinity,
            child: Card(
              child: Text("CHART",
                  style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
              color: Colors.blue,
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                margin: EdgeInsets.all(2),
                child: Container(
                   decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            color: Colors.white),
                   padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 3),
                            color: Colors.white),
                        child: Text(tx.amount.toString(),
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
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(tx.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800
                                )),
                          ),
                          Text(tx.date.toString(),
                              style: TextStyle(fontSize: 15, color: Colors.grey))
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
