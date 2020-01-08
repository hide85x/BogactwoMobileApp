import 'package:bogactwo/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// wszytskie statowe rzeczy robimy w userTransactions wiec zmieniamy ta klase na stateless
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
  
      height: 450,

      // wersja list view z builder, bez mapowania po naszej liscie
      //dla bardzo duzych list albo o nieznandej d;lugosci
      child: ListView.builder(
        // zamiast uzywac Continer opakowqanego SingleChildScrollView uzywamy ListView
        //ale potrzebuje miec usatwiony height rodzica, bo sam ListView ma heigh infinit
        //bez contaienra rodzicem bedzie Column z UserTrans. a column zabiera cały height jaki ma dostepny
        //dlatego oapkuwuejmy listView w container z ustalonym height
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 10,
            margin: EdgeInsets.all(1),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColorLight,
                  width: 2,
                ),
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColorDark,
                            width: 2),
                        color: Colors.white),
                    child: Text(
                        '\$${transactions[index].amount.toStringAsFixed(2)}', //transactions[index].amount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Theme.of(context).primaryColorDark)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: Text(transactions[index].title,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600)),
                      ),
                      Text(DateFormat.yMMMEd().format(transactions[index].date),
                          style: TextStyle(fontSize: 15, color: Colors.grey))
                    ],
                  )
                ],
              ),
            ),
          );
        },

        itemCount: transactions.length, //tyle razy wykona sie nasz itemBuilder
      ),
    );
  }
}

// list view ma dwa tryby pracy
// 1 gdzie podajemy children: children renderuje wszystkie childreny nawet jesli jest ich 100 i nie widac na naszym ekranie
// 2 z metoda build (ta renderuje tylko te elementy ktore sa widzialne) dla list duzych albo list ktorej dlugosci nie znamy

//WERSJA BEZ LISVIEW BUILDER
//dla list 7-10 elementowych

// return Container(
//   height: 320,
//   child: ListView(
//     // zamiast uzywac Continer opakowqanego SingleChildScrollView uzywamy ListView
//     //ale potrzebuje miec usatwiony height rodzica, bo sam ListView ma heigh infinit
//     //bez contaienra rodzicem bedzie Column z UserTrans. a column zabiera cały height jaki ma dostepny
//     //dlatego oapkuwuejmy listView w container z ustalonym height
//     children: transactions.map((transactions[index]) {
//       return Card(
//         margin: EdgeInsets.all(2),
//         child: Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.black, width: 2),
//               color: Colors.white),
//           padding: EdgeInsets.all(5),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.all(5),
//                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blue, width: 2),
//                     color: Colors.white),
//                 child: Text('\$${transactions[index].amount}', //transactions[index].amount.toString(),
//                     style: TextStyle(
//                         fontWeight: FontWeight.w800,
//                         fontSize: 20,
//                         color: Colors.blue)),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Container(
//                     child: Text(transactions[index].title,
//                         style: TextStyle(
//                             fontSize: 19, fontWeight: FontWeight.w600)),
//                   ),
//                   Text(DateFormat.yMMMEd().format(transactions[index].date),
//                       style: TextStyle(fontSize: 15, color: Colors.grey))
//                 ],
//               )
//             ],
//           ),
//         ),
//       );
//     }).toList(),
//   ),
// );
