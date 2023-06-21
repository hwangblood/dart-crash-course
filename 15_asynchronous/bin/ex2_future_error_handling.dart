Future<void> main(List<String> args) async {
  // * Future Error Handling

  /* 
    just using try/catch to capture the error, when consuming the Future
   */

  try {
    print(await getFullName(
      firstName: 'Foo',
      lastName: 'Bar',
    ));
  } catch (e) {
    print(e);
  }

  try {
    print(await getFullName(
      firstName: '',
      lastName: 'Bar',
    ));
  } catch (e) {
    print(e);
  }
}

Future<String> getFullName({
  required String firstName,
  required String lastName,
}) {
  if (firstName.isEmpty || lastName.isEmpty) {
    throw FirstOrLastNameMissingException();
  } else {
    return Future.value('$firstName $lastName');
  }
}

class FirstOrLastNameMissingException implements Exception {
  const FirstOrLastNameMissingException();
}
