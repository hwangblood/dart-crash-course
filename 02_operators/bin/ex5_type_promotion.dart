void main(List<String> args) {
  // * Type Promotion in Operators

  const int1 = 1;
  const int2 = 2;
  const double1 = 1.1;

  // double operator +(num other);
  const double result = double1 + int1;
  print('${result.runtimeType} $result');

  // num operator +(num other);
  const int result2 = int2 + int1;
  print('${result2.runtimeType} $result2');

  // num operator +(num other);
  const double result3 = int2 + double1;
  print('${result3.runtimeType} $result3');
}
