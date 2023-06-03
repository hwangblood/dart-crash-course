import 'dart:math' show Random;

void main(List<String> args) {
  // * Extending Functions

  print(add.callWithRandoms());
  print(subtract.callWithRandoms());
}

int add(int a, int b) => a + b;
int subtract(int a, int b) => a - b;

typedef IntFunction = int Function(int, int);

extension on IntFunction {
  int callWithRandoms() {
    final rnd1 = Random().nextInt(100);
    final rnd2 = Random().nextInt(100);
    print('random1: $rnd1 , random2: $rnd2');
    // this(a, b) refers to IntFunction
    // use call() to call a function fynamically without its name
    return call(rnd1, rnd2);
  }
}
