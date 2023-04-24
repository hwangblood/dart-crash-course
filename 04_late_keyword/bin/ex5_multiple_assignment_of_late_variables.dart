void main(List<String> args) {
  // * Multiple Assignment of Late Variables

  // simple late variable
  final person = Person();
  // print(person.description); // ! can't use late variable before initialization
  person.description = 'person description 1';
  print(person.description);
  person.description = ' person description 2';
  print(person.description);

  // late final variable, can't assign it more than once
  final dog = Dog();
  dog.description = 'dog description 1';
  print(dog.description);
  try {
    // ! can't re-assign a variable twice, when it with late and final modify
    dog.description = 'dog description 2';
    print(dog.description);
  } catch (e) {
    print(e);
  }
}

class Person {
  late String description;
}

class Dog {
  late final String description;
}
