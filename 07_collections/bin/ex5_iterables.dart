void main(List<String> args) {
  // * Iterables

  /* 
    Iterable is lazily generated, only instantiating some elements  when the elements are used
   */

  final iterable = Iterable.generate(
    20,
    (i) => getName(i),
  );

  // this for-in loop only generates the first two elements
  for (var name in iterable.take(2)) {
    print(name);
  }
}

String getName(int i) {
  print('Get name got called');
  return "John #$i";
}
