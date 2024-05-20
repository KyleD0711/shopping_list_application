const _emailAddressRegex =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

const passwordRegex = r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&-+=()])(?=\\S+$).{8, 20}$";

String? validateEmailAddress(String? input) {
  if (input == null) {
    return 'Something went wrong';
  }
  return RegExp(_emailAddressRegex).hasMatch(input)
      ? null
      : 'Invalid email format';
}

String? validatePassword(String? password) {
  if (password == null) {
    return 'Something went wrong';
  }
  return RegExp(passwordRegex).hasMatch(password)
      ? null
      : 'Invalid password';
}


