void main(List<String> args) {
  // * Mapping Lists to Iterables

  const names = ['John', 'Jane', 'Jack', 'Jill'];

  final upperCaseNames = names.map((name) {
    print('map() got called');
    return name.toUpperCase();
  });

  for (final name in upperCaseNames.take(3)) {
    print(name);
  }
}
