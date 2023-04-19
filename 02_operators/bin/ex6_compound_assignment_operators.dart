void main(List<String> args) {
  //* Compound Assignment Operators

  // ! You may want concat 'String' and 'num', but Dart is not supported
  // print('Hello' + 11);
  var myAge = 20;
  print(myAge = 30); // 30, myAge = 30

  print(myAge ~/= 2); // 15, myAge = myAge ~/ 2;
  print(myAge *= 2); // 30, myAge = myAge * 2;

  print(myAge += 4); // 34, myAge = myAge + 2;
  print(myAge -= 2); // 32, myAge = myAge - 2;

  print(myAge &= 2); // 0, myAge = myAge & 2;
  print(myAge |= 4); // 4, myAge = myAge | 4;
  print(myAge ^= 10); // 14, myAge = myAge ^ 10;

  print(myAge %= 4); // 2, myAge = myAge % 4;
}
