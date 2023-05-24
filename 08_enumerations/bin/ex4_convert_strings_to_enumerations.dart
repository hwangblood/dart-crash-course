void main(List<String> args) {
  // * Converting Strings to Enumerations

  print(AnimalType.values);
  for (final value in AnimalType.values) {
    print(value.name);
  }
  print('---------------------');

  /* Normal Functions */

  describe(animalType(fromStr: 'rabbit'));
  describe(animalType(fromStr: 'monkey'));

  print('---------------------');

  /* Static Enumeration Methods */

  describe(AnimalType.animalType(fromStr: 'cat'));
  describe(AnimalType.animalType(fromStr: 'horse'));
}

void describe(AnimalType? animalType) {
  switch (animalType) {
    case AnimalType.rabbit:
      print('This is a rabbit');
      break;
    case AnimalType.dog:
      print('This is a dog');
      break;
    case AnimalType.cat:
      print('This is a cat');
      break;
    default:
      print('Unknown animal: ${animalType?.name}');
  }
}

AnimalType? animalType({
  required String fromStr,
}) {
  try {
    return AnimalType.values.firstWhere(
      (element) => element.name == fromStr,
    );
  } catch (e) {
    return null;
  }
}

enum AnimalType {
  rabbit,
  dog,
  cat;

  static AnimalType? animalType({
    required String fromStr,
  }) {
    try {
      return AnimalType.values.firstWhere(
        (element) => element.name == fromStr,
      );
    } catch (e) {
      return null;
    }
  }
}
