void main(List<String> args) {
  // * Unwrapping Multiple Optionals

  String fullName = getfullName('zhenhong', 'hwang');
  print(fullName);

  String fullName2 = getfullName(null, 'hwang');
  print(fullName2);

  String fullName3 = getfullName('zhenhong', null);
  print(fullName3);

  String fullName4 = getfullName(null, null);
  print(fullName4);
}

String getfullName(
  String? firstName,
  String? lastName,
) =>
    combineAll(
      [firstName, lastName],
      (names) => names.join(' '),
    ) ??
    'Empty';

T? combineAll<T>(
  /// generic works like List<String?>, List<int?> ...
  List<T?> elements,
  T Function(List<T>) combineCallback,
) =>
    elements.any((e) => e == null)
        ? null
        : combineCallback(
            elements.cast<T>(),
          );
