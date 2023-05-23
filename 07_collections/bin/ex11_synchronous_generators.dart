void main(List<String> args) {
  // * Synchronous Generators

  for (final name in getNames()) {
    print(name);
  }
}

Iterable<String> getNames() sync* {
  print('Producing Name #first');
  yield 'Name #first';
  print('Producing template names');
  yield* templateNames();
  print('Producing Name #last');
  yield 'Name #last';
}

Iterable<String> templateNames({int? count = 2}) sync* {
  for (var i = 0; i < count!; i++) {
    print('Producing Name #$i');
    yield 'Name #$i';
  }
}
