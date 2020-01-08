import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // zmienilismy na statefull widget i mimo ze nie zmieniamy stanu tego widgeta
  // dzieki temu mozemy uzywac pól title i amoount przy dodaniu nowego szajsu
  // ze stateless widget kazde klikniecie na title i amount kasowało to pole
  final Function addTx;

  NewTransaction(this.addTx); 
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle= titleController.text;
    final enteredAmount= double.parse(amountController.text);
    if ( enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    //jesli chcemy przekazac cos z zewnatrz do widgeta to musimy to zrobic w construkotrze  widgeta a nie stanu!!!!
    widget.addTx(enteredTitle, enteredAmount);
    //dzieki property widget. mamy dostep do propsow classy StatefullWidget z wenatrz clasy State
    //jest dostepna tylko w klasie STATE

    Navigator.of(context).pop();
    //props CONTEXT daje nam dostep do kontekstu z klasy StatefullWidget! wewnatrz klasy State
    //zamyka nam najbardziej na wierzchu layer, w tym wypadku modalSheetBottom

    //.widget daje dostep do klasy widgetu a context do kontekstu tegoz widgeta
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 40,
      child: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title:"),
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => { zmienilismy na controller
              //   titleInput = val,
              // },
            ),
            TextField(
              keyboardType: TextInputType.number,
              // onChanged: (val) => {amountInput= val},
              // podajemu arg ze znakiem _ zeby zaznaczyc ze dostaniemy argument ale nie maamy zamiary go uzywac,
              // dostaniemy go z inputa usera, ale z racji ze przekazujemu submit data w anonymous funct to musimy ja wywolac ()
              onSubmitted: (_) => submitData(),
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount:"),
            ),
            RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  "Add shit",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.white),
                ),
                textColor: Colors.blue,
                onPressed: submitData)
          ],
        ),
      ),
    );
  }
}
