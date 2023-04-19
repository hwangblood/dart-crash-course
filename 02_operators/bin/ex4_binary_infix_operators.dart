void main(List<String> args) {
  // * Binary Infix Operators

  const age = 50;

  print(age + 20); // 70
  print(age - 20); // 30
  print(age * 20); // 1000
  print(age / 20); // 2.5
  print(age ~/ 20); // 2
  print(age % 20); // 10 , remainder
  print(age == 20); // false
  print(age != 20); // true

  print(age > 20); // true
  print(age < 20); // false
  print(age >= 20); // true
  print(age <= 20); // false

  // * Bitwise Operators (work on bits)

  // Bitwise AND: 1 & 1 = 1, otherwise 0
  print(age & 20);
  // Bitwise OR: 0 & 0 = 0, otherwise 1
  print(age | 20);
  // Bitwise XOR: 1 ^ 1 = 0, 0 ^ 0 = 0, otherwise 1
  print(age ^ 20);
  // Bitwise left shift
  // shift by 1: 0110 0011 => 1100 0110
  // shift by 2: 0110 0011 => 1000 1100
  print(age << 20);
  // Bitwise right shift
  // shift by 1: 0110 0011 => 0011 0001
  // shift by 2: 0110 0011 => 0001 1000
  print(age >> 20);
}
