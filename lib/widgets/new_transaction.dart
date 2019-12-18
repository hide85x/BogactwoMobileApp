import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController(); // podajemu te controllery w propsie control   naszych textArea input
  final amountController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 40,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: "Title:"),
                    // onChanged: (val) => {
                    //   titleInput = val,
                    // },
                  ),
                  TextField(
                    controller: amountController,
                    decoration: InputDecoration(labelText: "Amount:"),
                    // onChanged: (val) => {
                    //   amountInput = val,
                    // },
                  ),
                  FlatButton(
                    child: Text("Add shit",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),),
                    textColor: Colors.blue,
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    },
                  )
                ],
              ),
            ),
          );
  }
}