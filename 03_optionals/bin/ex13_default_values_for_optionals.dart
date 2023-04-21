void main(List<String> args) {
  // * Default Values for Optionals

  // In Rust Language
  // int? age; age.orDe fault, it will return 0
  // String? name; name.orDefault, it will return ''

  int? age;
  print('${12.orDefault} -- ${age.orDefault}');

  double? height;
  print('${3.14.orDefault} -- ${height.orDefault}');

  String? middleName;
  print('${'hwang'.orDefault} ${middleName.orDefault} ${'blood'.orDefault}');

  bool? bool1 = true;
  bool? bool2;
  print('${bool1.orDefault} -- ${bool2.orDefault}');

  List? list;
  try {
    print(list.orDefault);
  } catch (e) {
    print(e);
  }

  Object? obj;
  try {
    print(obj.orDefault);
  } catch (e) {
    print(e);
  }
}

extension DefaultValue<T> on T? {
  T get orDefault {
    final shadow = this;
    if (shadow != null) {
      return shadow;
    }
    switch (T) {
      case int:
        return 0 as T;
      case double:
        return 0.0 as T;
      case String:
        return 'X' as T;
      case bool:
        return false as T;
      default:
        throw Exception('No default value for type $T');
    }
  }
}
