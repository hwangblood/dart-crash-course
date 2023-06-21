void main(List<String> args) async {
  // * Stream.asyncExpand

  /* 
    ? what is the process of asyncExpand
    getNames()
        |
      200ms
        |              [ 300ms per character ]
      'John'            getCharacters('John')
                        | J -> o -> h -> n |
        |
      1000ms
        |              [ 300ms per character ]
      'Doe'             getCharacters('Doe')
                          | D -> o -> e |
   */

  await for (final character in getNames().asyncExpand(
    (name) => getCharacters(name),
  )) {
    print(character);
  }
}

Stream<String> getCharacters(String fromString) async* {
  for (var i = 0; i < fromString.length; i++) {
    await Future.delayed(Duration(milliseconds: 300));
    yield fromString[i];
  }
}

Stream<String> getNames() async* {
  await Future.delayed(Duration(milliseconds: 200));
  yield 'John';
  await Future.delayed(Duration(milliseconds: 1000));
  yield 'Doe';
}
