void main(List<String> args) {
  const int age1 = 63;
  const int age2 = 21;
  // * num +(num other)
  print(age1 + age2); // plus operator
  print(age1 + (age2 + 50)); // compound operator

  // * num -(num other)
  print(age1 - age2); // subtract operator

  // * num *(num other)
  print(age1 * age2); // Multiplication operator

  // * double /(num other), the result should always be a double
  print(age1 / age2); // Division operator

  // * int ~/(num other), , the result should always be a int
  print(age1 ~/ age2); // Truncating division operator.
  print(42.3 ~/ 21.9);

  // * num %(num other)
  final int remainedInt = age1 % age2; //  modulo division
  print(remainedInt);
  final double remainedDouble = age1 % 5.5;
  print(remainedDouble);
}
