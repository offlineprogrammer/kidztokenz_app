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

/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const UserType();
  final String id;
  final String dateCreated;
  final String fcmInstanceId;
  final String userEmail;
  final String userId;
  final List<Kid> kidz;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const User._internal(
      {@required this.id,
      this.dateCreated,
      this.fcmInstanceId,
      this.userEmail,
      this.userId,
      this.kidz});

  factory User(
      {@required String id,
      String dateCreated,
      String fcmInstanceId,
      String userEmail,
      String userId,
      List<Kid> kidz}) {
    return User._internal(
        id: id == null ? UUID.getUUID() : id,
        dateCreated: dateCreated,
        fcmInstanceId: fcmInstanceId,
        userEmail: userEmail,
        userId: userId,
        kidz: kidz != null ? List.unmodifiable(kidz) : kidz);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        dateCreated == other.dateCreated &&
        fcmInstanceId == other.fcmInstanceId &&
        userEmail == other.userEmail &&
        userId == other.userId &&
        DeepCollectionEquality().equals(kidz, other.kidz);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("User {");
    buffer.write("id=" + id + ", ");
    buffer.write("dateCreated=" + dateCreated + ", ");
    buffer.write("fcmInstanceId=" + fcmInstanceId + ", ");
    buffer.write("userEmail=" + userEmail + ", ");
    buffer.write("userId=" + userId);
    buffer.write("}");

    return buffer.toString();
  }

  User copyWith(
      {String id,
      String dateCreated,
      String fcmInstanceId,
      String userEmail,
      String userId,
      List<Kid> kidz}) {
    return User(
        id: id ?? this.id,
        dateCreated: dateCreated ?? this.dateCreated,
        fcmInstanceId: fcmInstanceId ?? this.fcmInstanceId,
        userEmail: userEmail ?? this.userEmail,
        userId: userId ?? this.userId,
        kidz: kidz ?? this.kidz);
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        dateCreated = json['dateCreated'],
        fcmInstanceId = json['fcmInstanceId'],
        userEmail = json['userEmail'],
        userId = json['userId'],
        kidz = json['kidz'] is List
            ? (json['kidz'] as List)
                .map((e) => Kid.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'dateCreated': dateCreated,
        'fcmInstanceId': fcmInstanceId,
        'userEmail': userEmail,
        'userId': userId,
        'kidz': kidz?.map((e) => e?.toJson())
      };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField DATECREATED = QueryField(fieldName: "dateCreated");
  static final QueryField FCMINSTANCEID =
      QueryField(fieldName: "fcmInstanceId");
  static final QueryField USEREMAIL = QueryField(fieldName: "userEmail");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField KIDZ = QueryField(
      fieldName: "kidz",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Kid).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.DATECREATED,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.FCMINSTANCEID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.USEREMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.KIDZ,
        isRequired: false,
        ofModelName: (Kid).toString(),
        associatedKey: Kid.USER));
  });
}

class UserType extends ModelType<User> {
  const UserType();

  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}
