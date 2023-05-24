void main(List<String> args) {
  // * Extending Enumerations

  /* 
    How to extend the Enumerations? you can use:
    - Define methods in an Enumeration
    - Create an extension on the Enumeration
   */

  AnimalType.cat
    ..jump()
    ..run();

  AnimalType.dog
    ..jump()
    ..run();

  AnimalType.rabbit
    ..jump()
    ..run();
}

enum AnimalType {
  cat,
  dog,
  rabbit;

  void run() {
    print('$name is Running...');
  }
}

extension Jump on AnimalType {
  void jump() {
    print('$name is Jumping...');
  }
}
