void main(List<String> args) {
  // * Untyped Null Values (dynamic)

  var someValue = null; // Infer to dynamic
  print(someValue.runtimeType);

  someValue = 10.2;

  print(someValue.runtimeType);
}
