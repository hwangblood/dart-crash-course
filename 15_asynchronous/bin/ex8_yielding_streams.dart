void main(List<String> args) async {
  // * Yielding Streams

  await for (final name in allNames()) {
    print(name);
  }
  print('--------------------');

  allNames().forEach(print);
}

Stream<String> maleNames() async* {
  yield 'M: John';
  yield 'M: Peter';
  yield 'M: Paul';
}

Stream<String> femaleNames() async* {
  yield 'F: Mary';
  yield 'F: Jane';
  yield 'F: Sue';
}

Stream<String> allNames() async* {
  yield* maleNames();
  yield* femaleNames();
}
