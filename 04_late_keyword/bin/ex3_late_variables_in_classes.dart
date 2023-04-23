// ignore_for_file: public_member_api_docs, sort_constructors_first
void main(List<String> args) {
  // * Late Variables in Classes

  final person = Person();
  print(person.age);

  // Initialize this late variable
  print(person.description);
}

class Person {
  final int age;

  /// Initial value when it firstly be used
  late String description = heavyCalculationOfDescription();
  Person({
    this.age = 30,
  }) {
    print('Constructor is called');
  }

  String heavyCalculationOfDescription() {
    print('Function heavyCalculationOfDescription is called');

    return 'Foo Bar';
  }
}
