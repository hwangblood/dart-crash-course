void main(List<String> args) {
  // * Lazy Initialization to a Function Result

  print('Before');

  // There, provideName() won't be called, because 'name' isn't be used
  late String name = provideName();

  print('After');

// call provideName() to initialize 'name' variable
  print(name);
}

String provideName() {
  print('Function is called');

  return 'Foo Bar';
}
