void main(List<String> args) {
  // * Default Value for Named Parameters

  describe();
  describe(something: null);
  describe(something: 'Hello, Dart!');
}

void describe({
  String? something = 'Hello, world!',
}) {
  print(something);
}
