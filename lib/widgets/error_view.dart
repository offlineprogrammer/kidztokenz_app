import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String error;
  final List<String> exceptions;

  ErrorView(this.error, this.exceptions);

  @override
  Widget build(BuildContext context) {
    if (error.isNotEmpty || exceptions.length > 0) {
      return Column(children: <Widget>[
        Text('Error: $error',
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: TextStyle(fontWeight: FontWeight.bold)),
        if (exceptions.length > 0) ...[_showExceptions()]
      ]);
    } else {
      return Container();
    }
  }

  _showExceptions() {
    return Column(
        children: exceptions.map((item) => new Text(item + " ")).toList());
  }
}
