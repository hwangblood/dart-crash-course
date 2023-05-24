void main(List<String> args) {
  // * Enumerations with Mixins

  /* 
    Mixins are kind like:
    - Protocol in Swift
    - Interface in Typescript
    - Interface in Java
  */

  AnimalType.cat.jump();
  AnimalType.dog.jump();

  try {
    AnimalType.fish.jump();
  } catch (e) {
    print(e);
  }
}

mixin CanJump {
  int get feetCount;

  void jump() {
    if (feetCount < 1) {
      throw Exception('$this Cannot jump');
    } else {
      print('$this Jumped!');
    }
  }
}

enum AnimalType with CanJump {
  cat(feetCount: 4),
  dog(feetCount: 4),
  fish(feetCount: 0);

  @override
  final int feetCount;

  @override
  void jump() {
    print('Can $name jump?');
    super.jump();
  }

  const AnimalType({required this.feetCount});
}
