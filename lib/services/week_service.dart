import 'package:shopping_list_application/models/week.dart';
import 'package:shopping_list_application/services/auth.dart';
import 'package:shopping_list_application/services/firestore_storage.dart';

class WeekService {
  static const _users = 'users';
  static const _weeks = 'weeks';
  static const _days = 'days';
  static const _beginningDate = 'beginningDate';
  static const _endDate = 'endDate';

  Stream<List<Week>> getWeeks() {
    return FirestoreStorage.database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_weeks)
        .snapshots()
        .map((event) => event.docs.map((e) {
              Map<String, dynamic> days = e.data()[_days];
              return Week(
                  id: e.id,
                  beginDate: DateTime.fromMillisecondsSinceEpoch(
                      e.data()[_beginningDate]),
                  endDate:
                      DateTime.fromMillisecondsSinceEpoch(e.data()[_endDate]),
                  days: days.map(
                      (key, value) => MapEntry(key, List<Map<String, String>>.from(value))));
            }).toList());
  }

  Stream<Week> getWeek(String weekId) {
    return FirestoreStorage.database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_weeks)
        .doc(weekId)
        .snapshots()
        .map((e) {
      Map<String, dynamic> days = e.data()![_days];
      return Week(
          id: e.id,
          beginDate:
              DateTime.fromMillisecondsSinceEpoch(e.data()![_beginningDate]),
          endDate: DateTime.fromMillisecondsSinceEpoch(e.data()![_endDate]),
          days: days
              .map((key, value) => MapEntry(key, List<Map<String,String>>.from(value))));
    });
  }

  Future<void> insertWeek(DateTime beginningDate,
      Map<String, List<String>> days) {
      
      DateTime endDate = beginningDate.add(const Duration(days: 7));
      final data = {
        "beginningDate": beginningDate.millisecondsSinceEpoch,
        "endDate": endDate.millisecondsSinceEpoch,
        "days": days
      };

    return FirestoreStorage.database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_weeks)
        .add(data);
  }

  Future<void> removeWeek(Week week) {
    return FirestoreStorage.database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_weeks)
        .doc(week.id)
        .delete();
  }
}
