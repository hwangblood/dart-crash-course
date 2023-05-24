void main(List<String> args) {
  // * Switch Enumerations

  final whiskers = AnimalType.dog;

  switch (whiskers) {
    case AnimalType.cat:
      print('This is a cat');
      break;
    case AnimalType.rabbit:
    case AnimalType.dog:
      // do nothing here
      break;
    default:
      print('This is not a cat');
  }
}

enum AnimalType {
  rabbit,
  dog,
  cat,
  monkey,
}
