void main(List<String> args) {
  // * Extending Overrides

  /* 
    ? Why extension names are necessary

    because when we define same extension method on a class, Dart couldn't 
    understand which method should be used
   */

  final jack = Person(name: 'Jack', age: 20);

  print(ShortDescription(jack).description);
  print(LongDescription(jack).description);
}

class Person {
  final String name;
  final int age;
  Person({
    required this.name,
    required this.age,
  });
}

/// short description of a person
extension ShortDescription on Person {
  String get description => '$name ($age)';
}

/// long description of a person
extension LongDescription on Person {
  String get description => '$name is $age years old';
}
