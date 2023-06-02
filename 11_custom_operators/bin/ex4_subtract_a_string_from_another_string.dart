void main(List<String> args) {
  // * Subtracting a String from Another String

  print("foo bar foo baz" - "foo");
  print("foo" - "foo");
  print("bar foo jim" - "foo");
}

extension Remove on String {
  String operator -(String other) => replaceAll(
        other,
        "",
      );
}
