import 'package:fraction/fraction.dart';
import 'package:shopping_list_application/models/quantity.dart';

bool validateQuantity(String? value) {
  if (value == "" || value == null) return false;

  List<String> splitValues = value.split(' ');
  print(splitValues);

  if (splitValues.length > 3 || splitValues.isEmpty) {
    return false;
  } else if (splitValues.length == 3) {
    print("In Length 3");
    if (int.tryParse(splitValues[0]) == null) {
      return false;
    } else if (!splitValues[0].isFraction) {
      return false;
    } else if (!(dryMeasurements + liquidMeasurements).contains(splitValues[2])) {
     return false;
    }
  } else if (splitValues.length == 2) {
    print("In length 2");
    if (int.tryParse(splitValues[0]) == null && !splitValues[0].isFraction) {
      return false;
    } else if (!(dryMeasurements + liquidMeasurements).contains(splitValues[1])) {
      return false;
    }
  } else {
    if (int.tryParse(splitValues[0]) == null) return false;
}

  return true;
}
