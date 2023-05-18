void main(List<String> args) {
  // * Mixing Various Parameter Styles

  describeFully('Foo');
  describeFully('Foo', lastName: null);
  describeFully('Foo', lastName: 'Baz');
}

/// Positional parameters must be placed before the named parameters.
void describeFully(
  String firstName, {
  String? lastName = 'Bar',
}) {
  print('Hello $firstName $lastName');
}
