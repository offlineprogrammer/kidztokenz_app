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
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the KidTask type in your schema. */
@immutable
class KidTask extends Model {
  static const classType = const KidTaskType();
  final String id;
  final String dateCreated;
  final String kidname;
  final String kidUUID;
  final String badTokenImageResourceName;
  final String tokenImageResourceName;
  final String tokenNumberImageResourceName;
  final int tokenNumber;
  final Kid kid;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const KidTask._internal(
      {@required this.id,
      this.dateCreated,
      this.kidname,
      this.kidUUID,
      this.badTokenImageResourceName,
      this.tokenImageResourceName,
      this.tokenNumberImageResourceName,
      this.tokenNumber,
      this.kid});

  factory KidTask(
      {@required String id,
      String dateCreated,
      String kidname,
      String kidUUID,
      String badTokenImageResourceName,
      String tokenImageResourceName,
      String tokenNumberImageResourceName,
      int tokenNumber,
      Kid kid}) {
    return KidTask._internal(
        id: id == null ? UUID.getUUID() : id,
        dateCreated: dateCreated,
        kidname: kidname,
        kidUUID: kidUUID,
        badTokenImageResourceName: badTokenImageResourceName,
        tokenImageResourceName: tokenImageResourceName,
        tokenNumberImageResourceName: tokenNumberImageResourceName,
        tokenNumber: tokenNumber,
        kid: kid);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KidTask &&
        id == other.id &&
        dateCreated == other.dateCreated &&
        kidname == other.kidname &&
        kidUUID == other.kidUUID &&
        badTokenImageResourceName == other.badTokenImageResourceName &&
        tokenImageResourceName == other.tokenImageResourceName &&
        tokenNumberImageResourceName == other.tokenNumberImageResourceName &&
        tokenNumber == other.tokenNumber &&
        kid == other.kid;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("KidTask {");
    buffer.write("id=" + id + ", ");
    buffer.write("dateCreated=" + dateCreated + ", ");
    buffer.write("kidname=" + kidname + ", ");
    buffer.write("kidUUID=" + kidUUID + ", ");
    buffer
        .write("badTokenImageResourceName=" + badTokenImageResourceName + ", ");
    buffer.write("tokenImageResourceName=" + tokenImageResourceName + ", ");
    buffer.write(
        "tokenNumberImageResourceName=" + tokenNumberImageResourceName + ", ");
    buffer.write("tokenNumber=" +
        (tokenNumber != null ? tokenNumber.toString() : "null") +
        ", ");
    buffer.write("kid=" + (kid != null ? kid.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  KidTask copyWith(
      {String id,
      String dateCreated,
      String kidname,
      String kidUUID,
      String badTokenImageResourceName,
      String tokenImageResourceName,
      String tokenNumberImageResourceName,
      int tokenNumber,
      Kid kid}) {
    return KidTask(
        id: id ?? this.id,
        dateCreated: dateCreated ?? this.dateCreated,
        kidname: kidname ?? this.kidname,
        kidUUID: kidUUID ?? this.kidUUID,
        badTokenImageResourceName:
            badTokenImageResourceName ?? this.badTokenImageResourceName,
        tokenImageResourceName:
            tokenImageResourceName ?? this.tokenImageResourceName,
        tokenNumberImageResourceName:
            tokenNumberImageResourceName ?? this.tokenNumberImageResourceName,
        tokenNumber: tokenNumber ?? this.tokenNumber,
        kid: kid ?? this.kid);
  }

  KidTask.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        dateCreated = json['dateCreated'],
        kidname = json['kidname'],
        kidUUID = json['kidUUID'],
        badTokenImageResourceName = json['badTokenImageResourceName'],
        tokenImageResourceName = json['tokenImageResourceName'],
        tokenNumberImageResourceName = json['tokenNumberImageResourceName'],
        tokenNumber = json['tokenNumber'],
        kid = json['kid'] != null
            ? Kid.fromJson(new Map<String, dynamic>.from(json['kid']))
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'dateCreated': dateCreated,
        'kidname': kidname,
        'kidUUID': kidUUID,
        'badTokenImageResourceName': badTokenImageResourceName,
        'tokenImageResourceName': tokenImageResourceName,
        'tokenNumberImageResourceName': tokenNumberImageResourceName,
        'tokenNumber': tokenNumber,
        'kid': kid?.toJson()
      };

  static final QueryField ID = QueryField(fieldName: "kidTask.id");
  static final QueryField DATECREATED = QueryField(fieldName: "dateCreated");
  static final QueryField KIDNAME = QueryField(fieldName: "kidname");
  static final QueryField KIDUUID = QueryField(fieldName: "kidUUID");
  static final QueryField BADTOKENIMAGERESOURCENAME =
      QueryField(fieldName: "badTokenImageResourceName");
  static final QueryField TOKENIMAGERESOURCENAME =
      QueryField(fieldName: "tokenImageResourceName");
  static final QueryField TOKENNUMBERIMAGERESOURCENAME =
      QueryField(fieldName: "tokenNumberImageResourceName");
  static final QueryField TOKENNUMBER = QueryField(fieldName: "tokenNumber");
  static final QueryField KID = QueryField(
      fieldName: "kid",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Kid).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "KidTask";
    modelSchemaDefinition.pluralName = "KidTasks";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: KidTask.DATECREATED,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: KidTask.KIDNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: KidTask.KIDUUID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: KidTask.BADTOKENIMAGERESOURCENAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: KidTask.TOKENIMAGERESOURCENAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: KidTask.TOKENNUMBERIMAGERESOURCENAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: KidTask.TOKENNUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: KidTask.KID,
        isRequired: false,
        targetName: "kidID",
        ofModelName: (Kid).toString()));
  });
}

class KidTaskType extends ModelType<KidTask> {
  const KidTaskType();

  @override
  KidTask fromJson(Map<String, dynamic> jsonData) {
    return KidTask.fromJson(jsonData);
  }
}
