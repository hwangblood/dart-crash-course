void main(List<String> args) {
  // * Type Matching

  print(doTypesMatch(1, 2));
  print(doTypesMatch(1, 2.2));
  print(doTypesMatch(1, 'Foo'));
  print(doTypesMatch('Foo', 'Bar'));

  print('=' * 20);

  print(doGenericTypesMatch(1, 2));
  print(doGenericTypesMatch(1, 2.2));
  print(doGenericTypesMatch(1, 'Foo'));
  print(doGenericTypesMatch('Foo', 'Bar'));
}

/// Matching types of two arguments is the same or not
bool doTypesMatch(Object a, Object b) {
  return a.runtimeType == b.runtimeType;
}

/// Matching Generic types of two arguments is the same or not
bool doGenericTypesMatch<L, R>(L a, R b) {
  return L == R;
}
