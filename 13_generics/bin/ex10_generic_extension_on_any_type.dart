void main(List<String> args) {
  // * Generic Extension on Any Data Type

  const Thing personThing = Person(name: 'Foo', age: 20);

  const Thing animalThing = Animal(name: 'Bar', species: 'Cat');

  final personName = personThing.mapIfOfType(
        (Person p) => p.name,
      ) ??
      'Unknown person name';
  print('pserson name: $personName');

  final animalName = animalThing.mapIfOfType(
        (Animal a) => a.name,
      ) ??
      'Unknown animal name';
  print('animal name: $animalName');

  final unknownName = 'haahhaaa'.mapIfOfType(
        (Animal a) => a.name,
      ) ??
      'Unknown animal name';
  print('unknown name: $unknownName');
}

abstract class Thing {
  final String name;
  const Thing({required this.name});
}

class Person extends Thing {
  final int age;

  const Person({
    required String name,
    required this.age,
  }) : super(name: name);
}

class Animal extends Thing {
  final String species;

  const Animal({
    required String name,
    required this.species,
  }) : super(name: name);
}

extension<T> on T {
  R? mapIfOfType<E, R>(R Function(E) f) {
    final shadow = this;
    if (shadow is E) {
      return f(shadow);
    } else {
      return null;
    }
  }
}
