import 'package:bogactwo/models/transaction.dart';
import 'package:bogactwo/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      //uzywamy var bo deklarujemy wartość jako double wczesniej okreslelismy tup zmiennej jako double

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      // print(DateFormat.E().format(weekDay));
      // // nie chce nam zwrocic wartosci z naszego obiektu typu date, musimy go sformatowac na strigopodobny
      // print(totalSum);
      // dateForma.E sluzy do dopasowania do kazdego naszego weekDay literki dnia tyg (M,T,W ...)
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList(); // odwraca nam liste dni tygdonia w charcie
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      print(sum);
      return sum + item['amount'];
    }); // zamienia nam naszą liste
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(12),
      child: Padding( // zamiast uzywania Container zeby ustawic padding
        padding: EdgeInsets.all(10),
        // margin: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            //jezeli tylko uzywamt property flex z Flexible, to mozemy zamiast Flexible uzyć widgeta : Expanded
            //props flex działa bardzo podobnie jak flexy cssowej
            return Flexible(
              fit: FlexFit.tight, // zajmuje cale dostepne miejsce
              child: ChartBar(
                // jeslicgemy owrpaowac go innym widegetem to tutaj, genealnie bezposredniego childa, w tym prypadku childa rowa
                data['day'],
                data['amount'],
                totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
