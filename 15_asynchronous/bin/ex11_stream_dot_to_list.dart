Future<void> main(List<String> args) async {
  // * Stream.toList

  final List<String> allNames = await getNames().toList();

  for (final name in allNames) {
    print(name);
  }
}

Stream<String> getNames() async* {
  yield 'John';
  yield 'Jane';
  yield 'Jack';
}
