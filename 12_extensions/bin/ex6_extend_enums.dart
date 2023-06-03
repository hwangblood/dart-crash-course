void main(List<String> args) {
  // * Extending Enums

  print(AnimalType.dog.containsUpperCaseInName);
  print(AnimalType.cat.containsUpperCaseInName);
  print(AnimalType.goldFish.containsUpperCaseInName);
}

enum AnimalType {
  cat,
  dog,
  goldFish,
}

extension on Enum {
  bool get containsUpperCaseInName => name.contains(
        RegExp(r'[A-Z]'),
      );
  // * also can check whether it already is completely lowercase
  // name != name.toLowerCase();
}
