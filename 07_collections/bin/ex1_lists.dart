void main(List<String> args) {
  // * Lists

  /*
    Lists are also called arrays in some other languages. such as Typescript.
    Lists are simply a collection of values that are written in serial
    so they start at index 0 and go ahead util index length-1.
  */

  const names = ['Foo', 'Bar', 'Baz', 'Qux'];

  for (final name in names) {
    print(name);
  }

  print('--------------------');

  for (final name in names.reversed) {
    print(name);
  }

  print('--------------------');

  if (names.contains('Bar')) {
    print('Bar is in the list');
  }

  print('--------------------');

  for (final name in names.where((element) => element.startsWith('B'))) {
    print(name);
  }

  print('--------------------');

  print(names[0]);
  print(names[1]);
  print(names[2]);
  print(names[3]);

  print('--------------------');

  try {
    print(names[4]);
  } catch (e) {
    print(e);
  }

  print('--------------------');

  names.sublist(1).forEach(print);
  print('--------------------');
  names.sublist(0, 2).forEach(print);
  print('--------------------');
  names.sublist(2, 3).forEach(print);
  print('--------------------');

  final ages = [20, 30, 40];
  ages.add(50);
  ages.add(60);
  ages.add(30); // * list can have duplicates
  print(ages);
  print('--------------------');

// if lists have same elements with the same ordering, then they are equal
  const names1 = ['Foo', 'Bar', 'Baz', 'Qux'];
  const names2 = ['Foo', 'Bar', 'Baz', 'Qux'];
  if (names1 == names2) {
    print('names1 and names2 are equal');
  } else {
    print('names1 and names2 are not equal');
  }

  print('--------------------');

  names.map((str) => str.toUpperCase()).forEach(print);
  names.map((str) => str.length).forEach(print);

  print('--------------------');

  final numbers = [1, 2, 3];
  final sum = numbers.fold(
    0,
    (
      int previousValue,
      int element,
    ) =>
        previousValue + element,
  );
  print(sum);

  print('--------------------');

  final totalLength = names.fold(
    0,
    (
      /* int */ previousValue,
      /* String */ element,
    ) =>
        previousValue + element.length,
  );
  print(totalLength);

  print('--------------------');

  final foldedResult = names.fold(
    '',
    (
      /* String */ value,
      /* String */ element,
    ) =>
        value.isNotEmpty
            ? '${value.toUpperCase()} ${element.toUpperCase()}'
            // initial value is empty string
            : element.toUpperCase(),
  );
  print(foldedResult);

  print('--------------------');

  final reducedResult = names.reduce(
    (
      /* String */ value,
      /* String */ element,
    ) =>
        '${value.toUpperCase()} ${element.toUpperCase()}',
  );
  print(reducedResult);

  print('--------------------');

  print(names.join(' ').toUpperCase());
}
