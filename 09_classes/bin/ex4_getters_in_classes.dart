void main(List<String> args) {
  // * Getters in Classes

  const foo = Person(firstName: 'Foo', lastName: 'Bar');
  print(foo);

  const john = Person(firstName: 'John', lastName: 'Doe');
  print(john.fullName);
  print(john);
}

// class Person {
//   final String firstName;
//   final String lastName;
//   final String fullName;

//   const Person({
//     required this.firstName,
//     required this.lastName,
//   }) : fullName = '$firstName $lastName';
// }

class Person {
  final String firstName;
  final String lastName;

  String get fullName {
    print('$firstName\'s fullName called');
    return '$firstName $lastName';
  }

  const Person({
    required this.firstName,
    required this.lastName,
  });

  @override
  String toString() => 'Person(firstName: $firstName, lastName: $lastName, '
      'fullName:$fullName)';
}
