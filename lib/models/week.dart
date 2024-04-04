import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Week {
  Week(
      {String? id,
      required this.beginDate,
      required this.endDate,
      required this.days})
      : id = id ?? _uuid.v1();

  static const _uuid = Uuid();
  final String id;
  final DateTime beginDate;
  final DateTime endDate;
  final Map<DateTime, List<Map<String, String>>> days;
}
