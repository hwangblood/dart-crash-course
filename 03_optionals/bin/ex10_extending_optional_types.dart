void main(List<String> args) {
  String? getFullNameOptional() {
    // return 'FOO';
    return null;
  }

  String getFullName() {
    return 'FOO BAR';
  }

  final String fullName = getFullNameOptional() ?? getFullName();
  print(fullName);

  // * Extending Optional Types

  // here, don't need to use null-aware operator
  null.describe();
  666.describe();
  'Hello'.describe();
}

extension Describe on Object? {
  void describe() {
    if (this == null) {
      print('this object is null');
    } else {
      print('$runtimeType: $this');
    }
  }
}
