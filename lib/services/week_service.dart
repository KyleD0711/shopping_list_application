import 'package:cloud_firestore_odm/annotation.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/services/auth.dart';
import 'package:shopping_list_application/services/user_service.dart';

class WeekService {

  @Collection<Week>('users/*/weeks')
  WeekCollectionReference weeks = UserService.usersRef.doc(Auth().userId).weeks;

  WeekCollectionReference getWeeks() {
    return weeks;
  }

  WeekDocumentReference getWeek(String id) {
    return weeks.doc(id);
  }
}
