void main(List<String> args) {
  // * Collection Comprehensions

  /* 
    Comprehensions are a kind of Python style Set, List and Dict comprehensions.  
  */

  /* Set Comprehensions */

  final string = 'ancdccdaa';
  String result = '';
  for (var char in string.split('')) {
    if (char == 'a' || char == 'b' || char == 'c') {
    } else {
      result += char;
    }
  }
  print(result);

  Set allExceptAbc = {
    for (final char in string.split('')) 'abc'.contains(char) ? null : char
  }
    ..removeAll([null])
    ..cast<String>();
  print(allExceptAbc);

  print('---------------------');

  /* List Comprehensions */

  final allNumbers = Iterable.generate(100);
  final /* List */ evenNumbers = [
    for (final number in allNumbers)
      if (number % 2 == 0) number
  ];
  final /* Iterable */ evenNumbersFunctional = allNumbers.where(
    (number) => number % 2 == 0,
  );
  final /* List */ oddNumbers = [
    for (final number in allNumbers)
      if (number % 2 != 0) number
  ];
  final /* Iterable */ oddNumbersFunctional = allNumbers.where(
    (number) => number % 2 != 0,
  );
  print(evenNumbers);
  print(evenNumbersFunctional);
  print(oddNumbers);
  print(oddNumbersFunctional);

  print('---------------------');

  /* Map Comprehensions */

  final names = [
    'John Doe',
    'James Smith',
    'Alice Jones',
  ];
  final namesAndLengths = {
    for (final name in names) name: name.length,
  };
  print(namesAndLengths);
}
