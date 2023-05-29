void main(List<String> args) {
  // * Mixins with hashCode Implementation

  /* 
    in this case, fisrt element and third element are same one, because have the
    same hash code, so that there are only two elements in the set
   */
  final cats = <Cat>{
    Cat(name: 'Kitty 1', age: 2),
    Cat(name: 'Kitty 2', age: 3),
    Cat(name: 'Kitty 1', age: 2),
  };

  cats.forEach(print);

  for (var cat in cats) {
    print(cat.hashCode);
  }
}

enum PetType {
  cat,
  dog,
  bird,
}

mixin Pet {
  String get name;
  int get age;
  PetType get type;

  @override
  String toString() => 'Pet(name: $name, age: $age, type: $type)';

  @override
  int get hashCode => Object.hash(
        name,
        age,
        type,
      );

  // * just compare the hashCode, no any more comparison
  @override
  bool operator ==(Object other) => hashCode == other.hashCode;
}

class Cat with Pet {
  @override
  final String name;

  @override
  final int age;

  @override
  final PetType type = PetType.cat;

  const Cat({
    required this.name,
    required this.age,
  });
}
