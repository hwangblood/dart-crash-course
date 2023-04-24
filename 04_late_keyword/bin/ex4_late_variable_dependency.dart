void main(List<String> args) {
  // * Late Variable Dependency

  final person = Person();

/* 
  fisrtName and lastName are depended on fullName,
  when anyone of them, which will initialize the fullName
 */
  print(person.firstName);

  print(person.lastName);
}

class Person {
  late String fullName = _getFullName();
  late String firstName = fullName.split(' ').first;
  late String lastName = fullName.split(' ').last;

  String _getFullName() {
    print('_getFullName() is called');

    return 'Foo Bar';
  }
}
