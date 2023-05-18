void main(List<String> args) {
  // * Returning Functions fron Functions

  final foo = doSomething(5, 20);
  print(foo());

  print(doSomething(10, 20)());
}

int Function() doSomething(
  int lhs,
  int rhs,
) =>
    () => lhs + rhs;
