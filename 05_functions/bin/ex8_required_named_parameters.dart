void main(List<String> args) {
  // * Required Named Parameters

  // ! invalid code, require a parameter called name
  // doSomethingWith();

  doSomethingWith(name: 'Foo');

  // ! invalid code, require a non-optional parameter
  // doSomethingWith(name: null);
}

void doSomethingWith({
  required String name,
}) {
  print('Hello, $name!');
}
