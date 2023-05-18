void main(List<String> args) {
  // * No Return Values

  // you would never invoke the function and assign
  // the result to a variable
  // ignore: unused_local_variable
  final void value = greet(); // ! must not do this!
}

void greet() {
  print('Greetings!');
}
