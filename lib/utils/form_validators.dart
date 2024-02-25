String? validateNonEmptyMessage(String? input) {
  return input == null || input.isEmpty ? 'This field must not be empty' : null;
}

String? validateInteger(String input) {
  return int.tryParse(input) == null ? "This field must be an integer" : null;
}