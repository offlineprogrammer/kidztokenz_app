/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Kid type in your schema. */
@immutable
class Kid extends Model {
  static const classType = const KidType();
  final String id;
  final String dateCreated;
  final String kidname;
  final String monsterImageResourceName;
  final String badTokenImageResourceName;
  final String tokenImageResourceName;
  final String tokenNumberImageResourceName;
  final int tokenNumber;
  final User user;
  final List<KidTask> taskz;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Kid._internal(
      {@required this.id,
      this.dateCreated,
      this.kidname,
      this.monsterImageResourceName,
      this.badTokenImageResourceName,
      this.tokenImageResourceName,
      this.tokenNumberImageResourceName,
      this.tokenNumber,
      this.user,
      this.taskz});

  factory Kid(
      {@required String id,
      String dateCreated,
      String kidname,
      String monsterImageResourceName,
      String badTokenImageResourceName,
      String tokenImageResourceName,
      String tokenNumberImageResourceName,
      int tokenNumber,
      User user,
      List<KidTask> taskz}) {
    return Kid._internal(
        id: id == null ? UUID.getUUID() : id,
        dateCreated: dateCreated,
        kidname: kidname,
        monsterImageResourceName: monsterImageResourceName,
        badTokenImageResourceName: badTokenImageResourceName,
        tokenImageResourceName: tokenImageResourceName,
        tokenNumberImageResourceName: tokenNumberImageResourceName,
        tokenNumber: tokenNumber,
        user: user,
        taskz: taskz != null ? List.unmodifiable(taskz) : taskz);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Kid &&
        id == other.id &&
        dateCreated == other.dateCreated &&
        kidname == other.kidname &&
        monsterImageResourceName == other.monsterImageResourceName &&
        badTokenImageResourceName == other.badTokenImageResourceName &&
        tokenImageResourceName == other.tokenImageResourceName &&
        tokenNumberImageResourceName == other.tokenNumberImageResourceName &&
        tokenNumber == other.tokenNumber &&
        user == other.user &&
        DeepCollectionEquality().equals(taskz, other.taskz);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Kid {");
    buffer.write("id=" + id + ", ");
    buffer.write("dateCreated=" + dateCreated + ", ");
    buffer.write("kidname=" + kidname + ", ");
    buffer.write("monsterImageResourceName=" + monsterImageResourceName + ", ");
    buffer
        .write("badTokenImageResourceName=" + badTokenImageResourceName + ", ");
    buffer.write("tokenImageResourceName=" + tokenImageResourceName + ", ");
    buffer.write(
        "tokenNumberImageResourceName=" + tokenNumberImageResourceName + ", ");
    buffer.write("tokenNumber=" +
        (tokenNumber != null ? tokenNumber.toString() : "null") +
        ", ");
    buffer.write("user=" + (user != null ? user.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Kid copyWith(
      {String id,
      String dateCreated,
      String kidname,
      String monsterImageResourceName,
      String badTokenImageResourceName,
      String tokenImageResourceName,
      String tokenNumberImageResourceName,
      int tokenNumber,
      User user,
      List<KidTask> taskz}) {
    return Kid(
        id: id ?? this.id,
        dateCreated: dateCreated ?? this.dateCreated,
        kidname: kidname ?? this.kidname,
        monsterImageResourceName:
            monsterImageResourceName ?? this.monsterImageResourceName,
        badTokenImageResourceName:
            badTokenImageResourceName ?? this.badTokenImageResourceName,
        tokenImageResourceName:
            tokenImageResourceName ?? this.tokenImageResourceName,
        tokenNumberImageResourceName:
            tokenNumberImageResourceName ?? this.tokenNumberImageResourceName,
        tokenNumber: tokenNumber ?? this.tokenNumber,
        user: user ?? this.user,
        taskz: taskz ?? this.taskz);
  }

  Kid.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        dateCreated = json['dateCreated'],
        kidname = json['kidname'],
        monsterImageResourceName = json['monsterImageResourceName'],
        badTokenImageResourceName = json['badTokenImageResourceName'],
        tokenImageResourceName = json['tokenImageResourceName'],
        tokenNumberImageResourceName = json['tokenNumberImageResourceName'],
        tokenNumber = json['tokenNumber'],
        user = json['user'] != null
            ? User.fromJson(new Map<String, dynamic>.from(json['user']))
            : null,
        taskz = json['taskz'] is List
            ? (json['taskz'] as List)
                .map((e) => KidTask.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'dateCreated': dateCreated,
        'kidname': kidname,
        'monsterImageResourceName': monsterImageResourceName,
        'badTokenImageResourceName': badTokenImageResourceName,
        'tokenImageResourceName': tokenImageResourceName,
        'tokenNumberImageResourceName': tokenNumberImageResourceName,
        'tokenNumber': tokenNumber,
        'user': user?.toJson(),
        'taskz': taskz?.map((e) => e?.toJson())
      };

  static final QueryField ID = QueryField(fieldName: "kid.id");
  static final QueryField DATECREATED = QueryField(fieldName: "dateCreated");
  static final QueryField KIDNAME = QueryField(fieldName: "kidname");
  static final QueryField MONSTERIMAGERESOURCENAME =
      QueryField(fieldName: "monsterImageResourceName");
  static final QueryField BADTOKENIMAGERESOURCENAME =
      QueryField(fieldName: "badTokenImageResourceName");
  static final QueryField TOKENIMAGERESOURCENAME =
      QueryField(fieldName: "tokenImageResourceName");
  static final QueryField TOKENNUMBERIMAGERESOURCENAME =
      QueryField(fieldName: "tokenNumberImageResourceName");
  static final QueryField TOKENNUMBER = QueryField(fieldName: "tokenNumber");
  static final QueryField USER = QueryField(
      fieldName: "user",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (User).toString()));
  static final QueryField TASKZ = QueryField(
      fieldName: "taskz",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (KidTask).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Kid";
    modelSchemaDefinition.pluralName = "Kids";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Kid.DATECREATED,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Kid.KIDNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Kid.MONSTERIMAGERESOURCENAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Kid.BADTOKENIMAGERESOURCENAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Kid.TOKENIMAGERESOURCENAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Kid.TOKENNUMBERIMAGERESOURCENAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Kid.TOKENNUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: Kid.USER,
        isRequired: false,
        targetName: "userID",
        ofModelName: (User).toString()));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Kid.TASKZ,
        isRequired: false,
        ofModelName: (KidTask).toString(),
        associatedKey: KidTask.KID));
  });
}

class KidType extends ModelType<Kid> {
  const KidType();

  @override
  Kid fromJson(Map<String, dynamic> jsonData) {
    return Kid.fromJson(jsonData);
  }
}
