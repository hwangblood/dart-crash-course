void main(List<String> args) {
  // * Comparing Optionals

  int? age = 10;

  // dart static analysis that age is 10, so there is a hint info
  if (age == null) {
    print('age is null');
  } else {
    print('age is not null');
  }

  age = null;
  compareWithNull(age);
}

void compareWithNull(int? age) {
  if (age == null) {
    print('age is null');
  } else {
    print('age is not null');
  }
}
