void main(List<String> args) {
  // * Null-Aware Operator
  final xyz = 'Foo';
  print(xyz.length);

  String? lastName = null;
  print(lastName?.length);

  lastName = 'Foo';
  print(lastName?.length);

  String? nullName;
  print(nullName ?? 'name is null');

  final lal = nullName ?? 'Lal';
  print(lal);

  String? fullName;
  final ana = nullName ?? fullName ?? 'ana';
  print(ana);
}
