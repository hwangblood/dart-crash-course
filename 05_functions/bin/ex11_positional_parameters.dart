void main(List<String> args) {
  // * Positional Parameters

  /// ! these are all invalid, positional paramters should always be provided
  /// sayGoodbyeTo();
  /// sayGoodbyeTo('Foo');

  sayGoodbyeTo('Foo', 'Bar');
  sayGoodbyeTo('Baz', 'Bar');
}

void sayGoodbyeTo(
  String person,
  String andOtherPerson,
) {
  print('Goodbye, $person and $andOtherPerson!');
}
