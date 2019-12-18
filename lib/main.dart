import './widgets/user_transactions.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

// importuje wszystkie NIE PRYWATNE propsy
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bogactwa"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        // domyslnie w columnie bedzie center, to troche jak flex
        children: <Widget>[
          //generalnie relacja rodzic > child jesli idzie o wielkosci elementow, trza uwazac!
          Container(
            // dlatego opakowujemy w container, albo TEXT albo CARD
            // size of card depends of its child , a text depends on card
            //gupia sprawa,  zaleznosc fontsize : card od child i child od text, bledne kolo
            //kombinowac trzeba z opakowawywaniem elementow w containery
            width: double.infinity,
            child: Card(
              child: Text("CHART",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  textAlign: TextAlign.center),
              color: Colors.blue,
              elevation: 2,
            ),
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}
