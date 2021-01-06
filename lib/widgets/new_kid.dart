import 'dart:math';

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

  dynamic listImagesnotFound = [
    'assets/images/m1.png',
    'assets/images/m2.png',
    'assets/images/m3.png',
    'assets/images/m4.png',
    'assets/images/m5.png',
    'assets/images/m6.png',
    'assets/images/m7.png',
    'assets/images/m8.png',
    'assets/images/m9.png',
    'assets/images/m10.png',
    'assets/images/m11.png'
  ];
  Random rnd;

  Widget buildImage(BuildContext context) {
    int min = 0;
    int max = listImagesnotFound.length - 1;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    String image_name = listImagesnotFound[r].toString();
    return Image.asset(
      image_name,
      fit: BoxFit.fitHeight,
      height: 150,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: buildImage(context),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Kid Name'),
                  controller: kidNameController,
                  onSubmitted: (_) => addNewKid(),
                ),
                RaisedButton(
                  onPressed: addNewKid,
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  child: Text('Add Kid'),
                )
              ],
            ),
          ),
        ],
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
