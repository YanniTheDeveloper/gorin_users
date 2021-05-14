import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic timestamp) {
    return timestamp?.toDate();
  }

  @override
  dynamic toJson(DateTime date) =>
      Timestamp.fromDate(date ?? Timestamp.now().toDate());
}
