import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewKid extends StatefulWidget {
  final Function addKid;

  NewKid(this.addKid);

  @override
  _NewKidState createState() => _NewKidState();
}

class _NewKidState extends State<NewKid> {
  final kidNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(150, 20, 150, 20),
              child: Container(
                height: 8.0,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Image.asset(
                  'assets/images/storeicon.png',
                  fit: BoxFit.fitHeight,
                  height: 250,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: kidNameController,
              onSubmitted: (_) => addNewKid(),
            ),
            RaisedButton(
              onPressed: addNewKid,
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }

  void addNewKid() {
    final enteredKidName = kidNameController.text;
    if (enteredKidName.isEmpty) {
      return;
    }

    widget.addKid(enteredKidName);
    Navigator.of(context).pop();
  }
}

/*Padding (
              padding: const EdgeInsets.fromLTRB(150,20,150,20) ,
              child: Container(
                height: 8.0,
                width: 80,
                decoration: BoxDecoration(color: Colors.grey[300],
                borderRadius: BorderRadius.all(const Radius.circular(8.0)),
              ),
            ),
            Padding(padding: const EdgeInsets.all(15) ,
            child: Image.asset(
                  'assets/images/storeicon.png',
                  fit: BoxFit.cover,
                )),*/
