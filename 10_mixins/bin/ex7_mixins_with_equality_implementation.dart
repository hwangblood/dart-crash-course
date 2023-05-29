import 'package:uuid/uuid.dart';

void main(List<String> args) {
  // * Mixins with Equality Implemention

  final uuid1 = const Uuid().v4();
  final uuid2 = const Uuid().v4();

  final person1 = Person(id: uuid1, name: 'Foo', age: 20);
  final person1Again = Person(id: uuid1, name: 'foo', age: 20);
  final person2 = Person(id: uuid2, name: 'Foo', age: 20);

  if (person1 == person2) {
    print('person1 and person2 are equal');
  } else {
    print('person1 and person2 are NOT equal');
  }

  if (person1 == person1Again) {
    print('person1 and person1Again are equal');
  } else {
    print('person1 and person1Again are NOT equal');
  }

  if (person1Again == person2) {
    print('person1Again and person2 are equal');
  } else {
    print('person1Again and person2 are NOT equal');
  }
}

mixin HasIdentifier {
  String get id;

  @override
  bool operator ==(Object other) =>
      // Check whether two references are to the same object. if they are same,
      // then the equlity operator should return true, otherwise it depends on
      // the OR logic
      identical(this, other) ||

      /* 
        the hand-write logic code below decides whether two references are equal

        if the two references have same type, and all properties are same to 
        each other, then we say that they are equal
       */

      // Check whether the `other` reference has mixed with HasIdentifier
      other is HasIdentifier &&
          // Check whether two references are working on the same type
          runtimeType == other.runtimeType &&
          id == other.id;
}

class Person with HasIdentifier {
  @override
  final String id;

  final String name;
  final int age;

  Person({
    required this.id,
    required this.name,
    required this.age,
  });

  @override
  String toString() => 'Person(id: $id, name: $name, age: $age)';
}
