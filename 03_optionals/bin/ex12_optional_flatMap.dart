// ignore_for_file: file_names

void main(List<String> args) {
  // * Optional FlatMap

  // flatMap works:  1 => '1' , null => null

  String? firstName = 'John';
  // String? lastName = 'Doe';
  String? lastName; // this should be null

  final fullName = firstName.flatMap<String>(
        (String f) => lastName.flatMap(
          (String l) => '$f $l',
        ),
      ) ??
      'Either first or last name or both are null';
  print(fullName);
}

extension FlatMap<T> on T? {
  R? flatMap<R>(R? Function(T) callback) {
    final shadow = this;
    if (shadow == null) {
      return null;
    } else {
      return callback(shadow);
    }
  }
}
