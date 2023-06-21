void main(List<String> args) {
  // * Generic Mixins and Specialized Mixin Type Definitions
  const person = Person(height: 1.7);
  const dog = Dog(height: 1);
  print(person);
  print(dog);
}

mixin HasHeight<H extends num> {
  H get height;
}

typedef HasIntHeight = HasHeight<int>;
typedef HasDoubleHeight = HasHeight<double>;

class Person with HasDoubleHeight {
  @override
  final double height;
  const Person({required this.height});

  @override
  String toString() => 'Person(height: $height)';
}

class Dog with HasIntHeight {
  @override
  final int height;

  const Dog({required this.height});

  @override
  String toString() => 'Dog(height: $height)';
}
