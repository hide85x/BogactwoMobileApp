import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentTotal);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 20,
        child: FittedBox(
          child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
        ),
      ),
      // zmniejsza nam nasz amoount zeby miescił sie elegancko w swoim column
      SizedBox(
        height: 4,
      ),
      Container(
        height: 70,
        width: 12,
        child: Stack(
          children: <Widget>[
            //pierwszy widget to ten bottom one
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 1.0),
                color: Color.fromRGBO(220, 220, 220, 0.8),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingPercentTotal,
              child: Container(
                decoration: BoxDecoration(color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20), // dzieki temu mamy zaokreaglone wyplenienia chartow!!!!
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Text(label),
    ]);
  }
}
