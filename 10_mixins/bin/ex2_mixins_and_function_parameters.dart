void main(List<String> args) {
  // * Mixins and Function Parameters

  /* 
    Mixins are just type, you can pass them as parameters to a function
   */

  final johnDoe = Person(firstName: 'John', lastName: 'Doe');
  print(johnDoe);
  print('fullName: ${johnDoe.fullName}');
  print(getFullName(johnDoe));
}

String getFullName(HasFullName obj) => obj.fullName;

mixin HasFirstName {
  String get firstName;
}

mixin HasLastName {
  String get lastName;
}

mixin HasFullName on HasFirstName, HasLastName {
  String get fullName => '$firstName $lastName';
}

class Person with HasFirstName, HasLastName, HasFullName {
  @override
  final String firstName;

  @override
  final String lastName;

  Person({
    required this.firstName,
    required this.lastName,
  });

  @override
  String toString() => 'Person(firstName: $firstName, lastName: $lastName)';
}
