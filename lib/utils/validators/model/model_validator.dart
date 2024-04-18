import 'package:fraction/fraction.dart';

const dryMeasurements = ['tbsp', 'tsp', 'cup', 'pound', 'gram', 'oz'];
const liquidMeasurements = ['tbsp', 'tsp', 'cup', 'quart', 'gallon', 'ml', 'l', 'fl. oz.', 'pint'];
const produceMeasurements = ['package', 'whole'];

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
