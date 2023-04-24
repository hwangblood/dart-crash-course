void main(List<String> args) {
  // * Avoiding a Common Pitfall with Late Variables

  // ? What is the solution to this pitfall?
  // * solution: A late variable shouldn't depend on any late variables
  // *
  // * but:
  // * avoid doing this in real code since it's against the recommendation.
  // * instead use nullable values

  final person = Person();

  try {
    // ! fullName's dependencies haven't be assigned
    // print(person.fullName);

    // ! fullName's dependency firstName hasn't be assigned
    // person.firstName = 'Foo';
    // print(person.fullName);

    // ! fullName's dependency firstName hasn't be assigned
    // person.lastName = 'Bar';
    // print(person.lastName);

    person.firstName = 'Foo';
    person.lastName = 'Bar';
    // when all denpendencies have be assigned, everything is ok
    print(person.fullName);
  } catch (e) {
    print(e);
  }
}

/// a late variable depend on a late final variable
class Person {
  late final String firstName;
  late final String lastName;

  late String fullName = '$firstName $lastName';
}
