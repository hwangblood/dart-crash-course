void main(List<String> args) {
  // * Constructors

  const me = Person('Bob', 20);
  print(me);
  print('---------------------');

  const foo = Person.foo();
  print(foo);
  print('---------------------');

  const bar = Person.bar(30);
  print(bar);
  print('---------------------');

  const baz = Person.other();
  print(baz);
  print('---------------------');

  const john = Person.other(name: 'John');
  print(john);
  print('---------------------');

  const jill = Person.other(name: 'Jill', age: 40);
  print(jill);
  print('---------------------');
}

class Person {
  final String name;
  final int age;

  const Person(
    this.name,
    this.age,
  );

  const Person.foo()
      : name = 'Foo',
        age = 20;

  const Person.bar(
    this.age,
  ) : name = 'Bar';

  const Person.other({
    String? name,
    int? age,
  })  : name = name ?? 'Baz',
        age = age ?? 18;

  @override
  String toString() => 'Person(name: $name, age: $age)';
}
