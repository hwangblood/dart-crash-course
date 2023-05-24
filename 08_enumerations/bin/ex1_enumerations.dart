void main(List<String> args) {
  // * Enumerations

  final woof = Animal(name: 'Woof', type: AnimalType.dog);

  /* 
    when you only want to handle a few values of an enum, if-else statement is fine.
   */

  if (woof.type == AnimalType.cat) {
    print('Woof is a cat');
  } else if (woof.type == AnimalType.dog) {
    print('Woof is a dog');
  }

  /* 
    Please always use switch-case instead of if-else, when you want to handle all values of an enumeration
   */

  switch (woof.type) {
    case AnimalType.rabbit:
      print('This is a rabbit');
      break;
    case AnimalType.dog:
      print('This is a dog');
      break;
    case AnimalType.cat:
      print('This is a cat');
      break;
  }
}

enum AnimalType {
  rabbit,
  dog,
  cat,
}

class Animal {
  final String name;
  final AnimalType type;

  Animal({
    required this.name,
    required this.type,
  });
}
