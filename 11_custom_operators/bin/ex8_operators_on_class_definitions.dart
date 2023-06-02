void main(List<String> args) {
  // * Operators on Class Definitions

  /* 
    Operators don't necessarily have to be created on extensions, they can 
    actually be cretaed in the original class
   */

  final john = Person(name: 'John', age: 22);
  print(john);

  final olderJohn1 = john + 1;
  print(olderJohn1);

  final olderJohn2 = olderJohn1 + 2;
  print(olderJohn2);
}

class Person {
  final String name;
  final int age;
  Person({
    required this.name,
    required this.age,
  });

  Person operator +(int moreAge) => Person(
        name: name,
        age: age + moreAge,
      );

  @override
  String toString() => 'Person(name: $name, age: $age)';
}
