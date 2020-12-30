import 'package:flutter/material.dart';

class KidItem extends StatelessWidget {
  final String kidName;
  final String kidImage;

  KidItem(this.kidName, this.kidImage);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          kidName,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.withOpacity(0.7),
              Colors.red,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
