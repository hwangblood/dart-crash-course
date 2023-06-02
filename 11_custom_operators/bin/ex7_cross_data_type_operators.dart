void main(List<String> args) {
  // * Cross Data Type Operators

  /* 
    Just now, Dart does not support define same operators

    But in Swift, it can define the same operator with different parameters
   */

  final mom1 = Person(name: 'Mom');
  final dad1 = Person(name: 'Dad');
  final son1 = Person(name: 'Son');
  final daugther1 = Person(name: 'Daugther');

  final dog1 = Pet(name: 'Dog');
  final cat2 = Pet(name: 'Cat');

  final john = Person(name: 'John');
  final jane = Person(name: 'Jane');

  final johns = john + jane;
  print(johns);

  final momWithCat = mom1 & cat2;
  print(momWithCat);

  final family = momWithCat + dad1;
  print(family);

  final withDog = family & dog1;
  print(withDog);

  final withSon = withDog + son1;
  print(withSon);

  final withDaugther = withSon + daugther1;
  print(withDaugther);

  final mergedFamily = johns ^ withDaugther;
  print(mergedFamily);
}

extension on Person {
  /// Person plus Person equal to Family
  Family operator +(Person other) => Family(
        members: [
          this,
          other,
        ],
        pets: [],
      );

  /// Add a Pet to Person
  Family operator &(Pet pet) => Family(
        members: [this],
        pets: [pet],
      );
}

extension on Family {
  /// Add a Pet to Family
  Family operator &(Pet pet) => Family(
        members: members,
        pets: [
          ...pets,
          pet,
        ],
      );

  /// Add a Person to Family
  Family operator +(Person person) => Family(
        members: [
          ...members,
          person,
        ],
        pets: pets,
      );

  /// Merge two Family into one Family
  Family operator ^(Family other) => Family(
        members: [
          ...members,
          ...other.members,
        ],
        pets: [
          ...pets,
          ...other.pets,
        ],
      );
}

class Person {
  final String name;
  Person({
    required this.name,
  });

  @override
  String toString() => 'Person(name: $name)';
}

class Pet {
  final String name;
  Pet({
    required this.name,
  });

  @override
  String toString() => 'Pet(name: $name)';
}

class Family {
  final Iterable<Person> members;
  final Iterable<Pet> pets;
  Family({
    required this.members,
    required this.pets,
  });

  @override
  String toString() => 'Family(\n\tmembers: $members, \n\tpets: $pets\n)';
}
