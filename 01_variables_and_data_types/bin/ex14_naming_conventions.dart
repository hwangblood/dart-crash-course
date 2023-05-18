void main(List<String> args) {
  // * The first word should be started with lowercase, and the rest words of
  // * variable name should be started with upppercase
  final yourAge = 'hwang';
  print(yourAge);

  // * this variable should start with 'w', but not 'W', or you can ignore it
  // ignore: non_constant_identifier_names
  final Hello = 'Helo';
  print(Hello);
  // ignore: non_constant_identifier_names
  final Wow = 'Wow';
  print(Wow);

  // * Ignore using a lowerCamelCase variable name
  // ignore: constant_identifier_names
  const SomeName = 'hwangblood';
  print(SomeName);
}
