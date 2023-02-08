void main(List<String> args) {
  String name = 'Foo';
  // String name = 123; // ! can't assign int to String

  var address = ''; // * auto to be String type
  address = name;

  // ! invalid operation
  // const age = 20;
  // address  = age

  print(address);
}
