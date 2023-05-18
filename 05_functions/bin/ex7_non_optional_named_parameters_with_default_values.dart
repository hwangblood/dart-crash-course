void main(List<String> args) {
  // * Non-Optional Named Parameters with Default Values

  doSomethingWith();
  doSomethingWith(name: 'Foo');

  // ! Non-Optional parameter can't reveive a optional value
  // doSomethingWith(name: null);
}

void doSomethingWith({
  String name = 'Bar',
}) {
  print('Hello, $name!');
}
