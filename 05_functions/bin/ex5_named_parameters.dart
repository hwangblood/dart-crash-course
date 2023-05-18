void main(List<String> args) {
  // * Named Parameters

  sayHelloTo();
  sayHelloTo(name: null);
  sayHelloTo(name: 'Foo');
}

void sayHelloTo({String? name}) {
  print('Hello, $name!');
}
