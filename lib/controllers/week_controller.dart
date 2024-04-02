import 'package:shopping_list_application/models/week.dart';
import 'package:shopping_list_application/services/week_service.dart';

class WeekController {
  factory WeekController() => _singleton;

  WeekController._internal();

  static final WeekController _singleton = WeekController._internal();

  static final _service = WeekService();

  Stream<List<Week>> getStream() {
    return _service.getWeeks();
  }

  Future<void> insertWeek(DateTime beginningDate, Map<String, List<String>> days
          ) =>
      _service.insertWeek(beginningDate, days);

  Future<void> removeWeek(Week week) => _service.removeWeek(week);

}