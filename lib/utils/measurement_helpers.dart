import 'package:fraction/fraction.dart';
import 'package:shopping_list_application/models/quantity.dart';

const measurements = [
  'tbsp',
  'tsp',
  'cup',
  'pound',
  'gram',
  'oz',
  'whole',
  'quart',
  'gallon',
  'ml',
  'l',
  'fl. oz.',
  'pint',
  'whole',
  'package',
  'fl oz',
  'liter',
  'milliliter',
  'pounds',
  'grams',
  'quarts',
  'gallons',
  'pints',
  'packages',
  'floz',
  'cups',
  'cloves'
];

const measurementSizeValues = {
  "ml": 1,
  "tsp": 2,
  "tbsp": 3,
  "fl. oz.": 4,
  "oz": 5,
  "cup": 6,
  "pint": 7,
  "quart": 8,
  "l": 9,
  "gallon": 10,
  "gram": 11,
  "pound": 12
};

const conversionValues = {
  "ml": ("tsp", 4.9289),
  "tsp": ("tbsp", 3.0),
  "tbsp": ("fl. oz.", 2.0),
  "fl. oz.": ("cup", 8.11537),
  "cup": ("pint", 2.0),
  "pint": ("quart", 2.0),
  "quart": ("l", 1.0),
  "l": ("gallon", 4.0),
  "gram": ("pound", 453.5)
};

String removePlural(String measurement) {
  if (measurement.endsWith("s")) {
    return measurement.substring(0, measurement.length - 1);
  }
  return measurement;
}

String fixFluidOunces(String measurement) {
  if (measurement == "fl. oz." || measurement == "floz") {
    return "fl oz";
  }
  return measurement;
}

String getStandardMeasurement(String measurement) {
  measurement = removePlural(measurement);
  return fixFluidOunces(measurement);
}

int getLargerMeasurement(String measurement1, String measurement2) {
  return measurementSizeValues[measurement1]! >
          measurementSizeValues[measurement2]!
      ? 0
      : 1;
}

Rational addMeasurements(Quantity biggerQuantity, Quantity smallerQuantity) {
  while (smallerQuantity.measurement != biggerQuantity.measurement) {
    var (String newMeasure, double conversionRatio) =
        conversionValues[smallerQuantity.measurement]!;

    smallerQuantity.amount =
        (smallerQuantity.amount.toDouble() / conversionRatio).toFraction();

    smallerQuantity.measurement = newMeasure;
  }

  return (biggerQuantity.amount.toDouble() + smallerQuantity.amount.toDouble())
      .toFraction();
}

Rational convertMLtoTSP(Rational quantity) {
  return (quantity.toDouble() / 4.92892).toFraction();
}

Rational convertTSPtoTBSP(Rational quantity) {
  return (quantity.toDouble() / 3).toFraction();
}

Rational convertTBSPtoCup(Rational quantity) {
  return (quantity.toDouble() / 16).toFraction();
}

Rational convertPintToQuart(Rational quantity) {
  return (quantity.toDouble() / 2).toFraction();
}

Rational convertQuartToGallon(Rational quantity) {
  return (quantity.toDouble() / 4).toFraction();
}

Rational convertFluidOunceToCup(Rational quantity) {
  return (quantity.toDouble() / 8).toFraction();
}

Rational convertGramToPound(Rational quantity) {
  return (quantity.toDouble() / 453.592).toFraction();
}

Rational convertLiterToGallon(Rational quantity) {
  return (quantity.toDouble() / 3.78541).toFraction();
}
