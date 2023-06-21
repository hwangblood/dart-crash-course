void main(List<String> args) async {
  // * Future Chaining

  // final length = await calculateLength(await getFullName());
  // print(length);

  final length = await getFullName().then(
    (value) => calculateLength(value),
  );
  print(length);

  final length2 = await Future.value('')
      .then(
    (value) => calculateLength(value),
  )
      .onError(
    // return -1 as the length of the string, it's an invalid length
    (e, _) {
      print(e);
      return Future.value(-1);
    },
  );
  print(length2);
}

Future<String> getFullName() => Future.delayed(
      const Duration(seconds: 1),
      () => 'John Doe',
    );

Future<int> calculateLength(String value) {
  if (value.isEmpty) {
    throw Exception('Invalid value provided');
  }
  return Future.delayed(
    const Duration(seconds: 1),
    () => value.length,
  );
}
