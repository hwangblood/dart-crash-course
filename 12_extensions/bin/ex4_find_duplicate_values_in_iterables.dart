void main(List<String> args) {
  // * Finding Duplicate Values in Iterables

  print([1, 2, 3].containsDuplicates);
  print([1, 2, 3, 1].containsDuplicates);

  print(['Foo', 'Bar'].containsDuplicates);
  print(['Foo', 'Bar', 'foo'].containsDuplicates);
  print(['Foo', 'Bar', 'Foo'].containsDuplicates);
}

extension on Iterable {
  bool get containsDuplicates => toSet().length != length;
}
