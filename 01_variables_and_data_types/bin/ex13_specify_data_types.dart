void main(List<String> args) {
  const String yourName = 'Foo Bar';

  // * The dart linter will say: here needs a type annotations
  final hisName = yourName;

  print(yourName);

  print(hisName);
}
