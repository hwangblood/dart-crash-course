void main(List<String> args) {
  // * Avoiding Constructor Initialization of Late Variables
  final johnDoe = Person(name: 'John Doe');
  final janeDoe = Person(name: 'Jane Doe');
  final doeFamily = WrongImplementationOfFamily(
    members: [
      johnDoe,
      janeDoe,
    ],
  );
  print(doeFamily);
  print(doeFamily.membersCount);

  final johnSmith = Person(name: 'John Smith');
  final janeSmith = Person(name: 'Jane Smith');
  final smithFamily = RightImplementationOfFamily(
    members: [
      johnSmith,
      janeSmith,
    ],
  );
  print(smithFamily);
  print(smithFamily.membersCount);
}

class Person {
  final String name;
  Person({
    required this.name,
  });
}

class WrongImplementationOfFamily {
  final Iterable<Person> members;
  late int membersCount;

  WrongImplementationOfFamily({
    required this.members,
  }) {
    // ! don't do this, function calls when constructor is called
    membersCount = getMemberCount();
  }

  int getMemberCount() {
    print('Getting members count');
    return members.length;
  }
}

class RightImplementationOfFamily {
  final Iterable<Person> members;
  // * this way is fine, function calls only when variable is used
  late int membersCount = getMemberCount();

  RightImplementationOfFamily({
    required this.members,
  });

  int getMemberCount() {
    print('Getting members count');
    return members.length;
  }
}
