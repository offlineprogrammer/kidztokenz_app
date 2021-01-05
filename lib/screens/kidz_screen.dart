import 'package:flutter/material.dart';
import 'package:kidztokenz_app/models/kid.dart';
import 'package:kidztokenz_app/widgets/kid_item.dart';

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
    );
  }
}
