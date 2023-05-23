void main(List<String> args) {
  // * Spread Operator with Collections

  addToArrayWrong();
  print('-------------');
  addToArrayRight();
  print('-------------');
  addToDictionaryWrong();
  print('-------------');
  addToDictionaryRight();
  print('-------------');
}

void addToArrayWrong() {
  final names1 = ['Foo 1', 'Bar 1', 'Baz 1'];
  final names2 = ['Foo 2', 'Bar 2', 'Baz 2'];
  final allNamesWrong = names1;
  allNamesWrong.addAll(names2);
  print(names1);
  print(names2);
  print(allNamesWrong);
}

void addToArrayRight() {
  final names1 = ['Foo 1', 'Bar 1', 'Baz 1'];
  final names2 = ['Foo 2', 'Bar 2', 'Baz 2'];
  final allNamesRight = [...names1, ...names2];
  print(names1);
  print(names2);
  print(allNamesRight);
  final anotherWay = {...names1}..addAll(names2);
  print(anotherWay);
}

void addToDictionaryWrong() {
  // when using const modifier, the variable will be unmodifiable
  const info = {
    'name': 'Foo',
    'age': 20,
    'height': 1.8,
  };
  try {
    final result = info;
    print('${result.hashCode} ${info.hashCode}');
    print(result.runtimeType);
    result.addAll({'weight': 80});
  } catch (e) {
    print(e);
  }
}

void addToDictionaryRight() {
  const info = {
    'name': 'Foo',
    'age': 20,
    'height': 1.8,
  };
  // info is const, but {...info} is mutable
  final result = {...info}..addAll({'weight': 80});
  print(result);
}
