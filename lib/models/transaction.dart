import 'package:flutter/foundation.dart'; // @required nam daje ten import

class Transaction {
  //final przed zmiennymi, jest runtime const, co znaczy że kiedy swtowrzymy za pomoca constructora 
  // egzemplarz klasy to ten się już nie zmieni!
  final String id; 
  final String title;
  final double amount;
  final DateTime date;
  // { w klamrach mozemy uzywac named arguments i wtedy nie martwimy sie o kolejnosc args podawanych w constructorze}
  Transaction({
   @required this.id,
   @required this.title,
   @required this.amount,
   @required this.date,
  });
}
