void main(List<String> args) {
  // * Assigning Late Variables to Non Late Variables

  late String firstName = provideFirstName();
  late String lastName = provideLastName();

  // when assign late variables to non late variables, the late variables will
  // be initialzed  before
  print('fullName is initialzing...');
  final String fullName = '$firstName $lastName';
  print('fullName is initialzed.');

  print(fullName);
}

String provideFirstName() {
  print('provideFirstName() called');

  return 'Foo';
}

String provideLastName() {
  print('provideLastName() called');

  return 'Bar';
}
