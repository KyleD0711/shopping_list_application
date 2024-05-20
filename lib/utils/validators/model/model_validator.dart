import 'package:fraction/fraction.dart';
import 'package:shopping_list_application/utils/measurement_helpers.dart';


String? validateQuantity(String? value) {
  if (value == "" || value == null) return "Error";
  List<String> splitValues = value.split(' ');

  if (splitValues.length > 4 || splitValues.isEmpty) {
    return "Error: Measurement format not supported";
  } else if (splitValues.length == 4) {
    if (!measurements.contains('${splitValues[3]} ${splitValues[4]}')) {
      return "Error: Incorrect measurement.";
    }
  } else if (splitValues.length == 3) {
    if (int.tryParse(splitValues[0]) == null) {
      return "Error: Please enter an integer or a fraction";
    } else if (!splitValues[0].isFraction) {
      return "Error: Please enter an integer or a fraction";
    } else if (!measurements.contains(splitValues[2])) {
      return "Error: Incorrect measurement.";
    }
  } else if (splitValues.length == 2) {
    if (int.tryParse(splitValues[0]) == null && !splitValues[0].isFraction) {
      return "Error: Please enter an integer or a fraction";
    } else if (!measurements.contains(splitValues[1])) {
      return "Error: Incorrect measurement";
    }
  } else {
    if (int.tryParse(splitValues[0]) == null && !splitValues[0].isFraction && !splitValues[0].isMixedFraction) return "Error: Please enter an integer or a fraction";
  }

  return null;
}
