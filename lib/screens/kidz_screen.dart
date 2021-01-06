import 'package:flutter/material.dart';
import 'package:kidztokenz_app/models/kid.dart';
import 'package:kidztokenz_app/widgets/kid_item.dart';
import 'package:kidztokenz_app/widgets/new_kid.dart';

class KidzScreen extends StatelessWidget {
  final List<Kid> kidz = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kidz'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: kidz
            .map(
              (catData) => KidItem(
                catData.kidname,
                catData.tokenImageResourceName,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewKid(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

_startAddNewKid(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: NewKid(_addNewKid),
          behavior: HitTestBehavior.opaque,
        );
      });
}

_addNewKid() {}
