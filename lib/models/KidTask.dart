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

/** This is an auto generated class representing the KidTask type in your schema. */
@immutable
class KidTask extends Model {
  static const classType = const KidTaskType();
  final String id;
  final String dateCreated;
  final String taskName;
  final String taskImageResourceName;
  final String taskImageUrl;
  final List<int> taskTokenzScore;
  final bool negativeReTask;
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
      this.taskName,
      this.taskImageResourceName,
      this.taskImageUrl,
      this.taskTokenzScore,
      this.negativeReTask,
      this.kid});

  factory KidTask(
      {@required String id,
      String dateCreated,
      String taskName,
      String taskImageResourceName,
      String taskImageUrl,
      List<int> taskTokenzScore,
      bool negativeReTask,
      Kid kid}) {
    return KidTask._internal(
        id: id == null ? UUID.getUUID() : id,
        dateCreated: dateCreated,
        taskName: taskName,
        taskImageResourceName: taskImageResourceName,
        taskImageUrl: taskImageUrl,
        taskTokenzScore: taskTokenzScore != null
            ? List.unmodifiable(taskTokenzScore)
            : taskTokenzScore,
        negativeReTask: negativeReTask,
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
        taskName == other.taskName &&
        taskImageResourceName == other.taskImageResourceName &&
        taskImageUrl == other.taskImageUrl &&
        DeepCollectionEquality()
            .equals(taskTokenzScore, other.taskTokenzScore) &&
        negativeReTask == other.negativeReTask &&
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
    buffer.write("taskName=" + taskName + ", ");
    buffer.write("taskImageResourceName=" + taskImageResourceName + ", ");
    buffer.write("taskImageUrl=" + taskImageUrl + ", ");
    buffer.write("taskTokenzScore=" +
        (taskTokenzScore != null ? taskTokenzScore.toString() : "null") +
        ", ");
    buffer.write("negativeReTask=" +
        (negativeReTask != null ? negativeReTask.toString() : "null") +
        ", ");
    buffer.write("kid=" + (kid != null ? kid.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  KidTask copyWith(
      {String id,
      String dateCreated,
      String taskName,
      String taskImageResourceName,
      String taskImageUrl,
      List<int> taskTokenzScore,
      bool negativeReTask,
      Kid kid}) {
    return KidTask(
        id: id ?? this.id,
        dateCreated: dateCreated ?? this.dateCreated,
        taskName: taskName ?? this.taskName,
        taskImageResourceName:
            taskImageResourceName ?? this.taskImageResourceName,
        taskImageUrl: taskImageUrl ?? this.taskImageUrl,
        taskTokenzScore: taskTokenzScore ?? this.taskTokenzScore,
        negativeReTask: negativeReTask ?? this.negativeReTask,
        kid: kid ?? this.kid);
  }

  KidTask.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        dateCreated = json['dateCreated'],
        taskName = json['taskName'],
        taskImageResourceName = json['taskImageResourceName'],
        taskImageUrl = json['taskImageUrl'],
        taskTokenzScore = json['taskTokenzScore']?.cast<int>(),
        negativeReTask = json['negativeReTask'],
        kid = json['kid'] != null
            ? Kid.fromJson(new Map<String, dynamic>.from(json['kid']))
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'dateCreated': dateCreated,
        'taskName': taskName,
        'taskImageResourceName': taskImageResourceName,
        'taskImageUrl': taskImageUrl,
        'taskTokenzScore': taskTokenzScore,
        'negativeReTask': negativeReTask,
        'kid': kid?.toJson()
      };

  static final QueryField ID = QueryField(fieldName: "kidTask.id");
  static final QueryField DATECREATED = QueryField(fieldName: "dateCreated");
  static final QueryField TASKNAME = QueryField(fieldName: "taskName");
  static final QueryField TASKIMAGERESOURCENAME =
      QueryField(fieldName: "taskImageResourceName");
  static final QueryField TASKIMAGEURL = QueryField(fieldName: "taskImageUrl");
  static final QueryField TASKTOKENZSCORE =
      QueryField(fieldName: "taskTokenzScore");
  static final QueryField NEGATIVERETASK =
      QueryField(fieldName: "negativeReTask");
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
        key: KidTask.TASKNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: KidTask.TASKIMAGERESOURCENAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: KidTask.TASKIMAGEURL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: KidTask.TASKTOKENZSCORE,
        isRequired: false,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.collection,
            ofModelName: describeEnum(ModelFieldTypeEnum.int))));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: KidTask.NEGATIVERETASK,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

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
