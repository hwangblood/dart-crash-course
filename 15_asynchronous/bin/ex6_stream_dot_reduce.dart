Future<void> main(List<String> args) async {
  // * Stream.reduce

  /* 
    Stream.reduce is very similar to Iterable.reduce
   */

  final sum = await getAllAges().reduce(add);
  print('Sum of all numbers is $sum'); // 150
}

int add(int a, int b) {
  print('$a + $b = ${a + b}');
  return a + b;
}

Stream<int> getAllAges() async* {
  yield 10;
  yield 20;
  yield 30;
  yield 40;
  yield 50;
}
