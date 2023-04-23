late String name;

void main(List<String> arguments) {
  // * Lazy Initialization and Errors

  // ! Field 'name' has not been initialized.
  try {
    print(name);
  } catch (e) {
    print(e);
  }

  name = 'Foo Bar';
  print(name);

  name = 'Foo Bar 22';
  print(name);
}
