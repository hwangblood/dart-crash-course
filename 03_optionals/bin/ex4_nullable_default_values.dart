void main(List<String> args) {
  // * Nullable Default Values

  String? lastName;
  print(lastName);

  // * Null aware assignment operator (compound assignment)
  // if lastName is null, set it to 'Bar'
  lastName ??= 'Bar';
  print(lastName);

  String? firstName = 'Foo';
  // dart knowns that firstName is not null, so here is warning
  firstName ??= 'Bar';
  print(firstName);

  String? fullName;
  String s = nullAssignString(fullName, 'hwangblood');
  print(s);
}

String nullAssignString(String? one, String two) {
  one ??= two;
  return one;
}
