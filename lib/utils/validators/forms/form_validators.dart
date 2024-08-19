import 'package:fraction/fraction.dart';

String? validateNonEmptyMessage(String? input) {
  return input == null || input.isEmpty ? 'This field must not be empty' : null;
}

String? validateInteger(String input) {
  return int.tryParse(input) == null ? "This field must be an integer" : null;
}

String? validateFractionOrInteger(String input) {
  try {
    return Rational.tryParse(input) == null
        ? "Invalid input. Valid inputs are a/b or a b/c"
        : null;
  } on Exception {
    return "This field must be an integer or fraction";
  }
}

String? validateIngredientType(String input) {
  return input == "dry" || input == "liquid" || input == "produce"
      ? null
      : "Invalid input. Valid inputs are dry, liquid, or produce";
}

String? validateShoppingListItemName(
    List<Map<String, String>> shoppingListItems, String? newName) {
  if (newName == null || newName == "") {
    return "Name can't be empty";
  }
  bool nameDoesntExistInList =
      shoppingListItems.every((element) => element["name"] != newName);
  return !nameDoesntExistInList ? "This item already exists in list" : null;
}
