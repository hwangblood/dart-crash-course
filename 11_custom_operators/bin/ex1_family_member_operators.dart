void main(List<String> args) {
  // * Family Member Operators

  /* 
    In this example, we want is when two FamilyMember objects plused, then we 
    should get a Family object as result that contains all members 
   */

  final dad = FamilyMember(name: 'Dad');
  final mom = FamilyMember(name: 'Mom');

  final family = dad + mom;

  print(dad);
  print(mom);
  print(family);
}

class FamilyMember {
  final String name;
  const FamilyMember({
    required this.name,
  });

  @override
  String toString() => 'FamilyMember(name: $name)';
}

class Family {
  final List<FamilyMember> members;
  const Family({
    required this.members,
  });

  @override
  String toString() => 'Family(members: $members)';
}

extension ToFamily on FamilyMember {
  /// member1 + member2
  ///
  /// this + other
  Family operator +(FamilyMember other) => Family(members: [
        this,
        other,
      ]);
}
