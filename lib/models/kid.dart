import 'package:flutter/material.dart';

class Kid {
  final String kidName;
  final String monsterImageResourceName;
  final DateTime createdDate;
  final String tokenImageResourceName;
  final String badTokenImageResourceName;
  final String tokenNumberImageResourceName;
  final int tokenNumber;
  final String kidUUID;

  const Kid({
    @required this.kidName,
    @required this.monsterImageResourceName,
    this.createdDate,
    this.tokenImageResourceName = "",
    this.badTokenImageResourceName = "",
    this.tokenNumberImageResourceName = "",
    this.tokenNumber = 0,
    this.kidUUID = "",
  });
}
