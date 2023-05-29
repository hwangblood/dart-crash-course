void main(List<String> args) {
  // * Mixins with Logic

  /* 
    Mixins can have properties , and also can have functions
   */

  final whiskers = Cat(age: 2);

  print('before incrementing');
  print(whiskers);

  whiskers.incrementAge();
  print('after incrementing');
  print(whiskers);

  print('---------- stactic method ----------');
  HasAge.doStaticMethod();
}

mixin HasAge {
  abstract int age;

  void incrementAge() => age++;

  static void doStaticMethod() => print('HasAge is doing static method');
}

class Cat with HasAge {
  @override
  int age;

  Cat({
    required this.age,
  });

  @override
  String toString() => 'Cat(age: $age)';
}
