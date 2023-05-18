void main(List<String> args) {
  // * Optional Positional Parameters

  makeUpperCase();
  makeUpperCase(null);
  makeUpperCase('Foo');
  makeUpperCase('Foo', 'Bar2');

  // ! the second parameter is not optional
  // makeUpperCase('Foo', null);

  makeUpperCase(null, 'Bar3');
}

/// Optional positional parameters should work within square brackets.
/// and the parameters must be optional or with default values.
void makeUpperCase([
  String? name,
  String lastName = 'Bar',
]) {
  print('name: ${name?.toUpperCase()}');
  print('lastName: ${lastName.toUpperCase()}');
}
