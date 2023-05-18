void main(List<String> args) {
  // * Functions as First Class Citizens

  print(minus());
  print(minus(30, 20));
  print(minus(20, 30));

  print(
    performOperation(4, 6, (a, b) => a + b),
  );
  print(
    performOperation(4, 6, (a, b) => a - b),
  );

  print(
    performOperation(10, 20, add),
  );
  print(
    performOperation(10, 20, minus),
  );
}

int performOperation(
  int a,
  int b,
  int Function(int, int) operation,
) =>
    operation(a, b);

int minus([int lhs = 10, int rhs = 5]) => lhs - rhs;

int add([int lhs = 10, int rhs = 5]) => lhs + rhs;
