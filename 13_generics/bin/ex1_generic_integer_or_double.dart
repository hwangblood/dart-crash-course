void main(List<String> args) {
  // * Generic Integer or Double

  // return num type, can't be assigned as double
  final doubleValue = eitherIntOrDouble(WhatToReturn.douubleType) as double;
  // return num type, can't be assigned as int
  final integerValue = eitherIntOrDouble(WhatToReturn.integerType);

  print('$doubleValue ${doubleValue.runtimeType}');
  print('$integerValue ${integerValue.runtimeType}');

  /* 
    There is a problem with the return type, we can't known it is whether int or
    double without as TYPE

    But, with Generic we kown the return value can be what kinds of types,
    so that we can assign the value to a specific type
   */

  final double doubleValue2 = eitherIntOrDouble2();
  final int integerValue2 = eitherIntOrDouble2();

  print('$doubleValue2 ${doubleValue2.runtimeType}');
  print('$integerValue2 ${integerValue2.runtimeType}');

  try {
    final String stringValue2 = eitherIntOrDouble2();
  } catch (e) {
    print(e);
  }
}

enum WhatToReturn { integerType, douubleType }

/// Always returns [num] type value, but don't know [int] or [double] explicitly
num eitherIntOrDouble(WhatToReturn whatToReturn) {
  switch (whatToReturn) {
    case WhatToReturn.integerType:
      return 1;
    case WhatToReturn.douubleType:
      return 1.0;
    // default case should never happen
    default:
      throw Exception('Not Supported type');
  }
}

/// using Generic type, usually use one character for generic type
///
/// Example:
///
/// T -> any type
/// E -> type for a element
T eitherIntOrDouble2<T extends num>() {
  switch (T) {
    case int:
      return 1 as T;
    case double:
      return 1.0 as T;
    // when using Generic type, default case should be required
    default:
      throw Exception('Unknown type');
  }
}
