void main(List<String> args) {
  // * Inheriting Constructors

  final mom = Mom(Role.mom);
  print(mom.role);

  final dad = Dad(/* Role.dad */);
  print(dad.role);

  final son = Son();
  print(son.role);

  final daughter = Daughter(role: Role.daughter);
  print(daughter.role);

  final grandpa = Grandpa();
  print(grandpa.role);

  final person = Person(role: Role.grandma);
  print(person.role);
}

enum Role { mom, dad, son, daughter, grandpa, grandma }

class Person {
  final Role role;

  const Person({
    required this.role,
  });
}

class Mom extends Person {
  const Mom(Role role) : super(role: role);
}

class Dad extends Person {
  const Dad([Role role = Role.dad]) : super(role: role);
}

class Son extends Person {
  Son() : super(role: Role.son);
}

class Daughter extends Person {
  Daughter({required super.role});
}

class Grandpa extends Person {
  Grandpa({super.role = Role.grandpa});
}
