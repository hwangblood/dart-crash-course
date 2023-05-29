void main(List<String> args) {
  // * Addition of Two Optional Integers

  /* 
    This + operator should not just work with integers, it should work with num type, even any other types
   */

  print(add());
  print(add(10)); // add(1, null)
  print(add(null, 20));
  print(add(10, 20));
}

int add([int? a, int? b]) {
  return a + b;
}

extension NullableAdd<T extends num> on T? {
  T operator +(T? other) {
    /*
      we will use pure + operator in this custom + operator, that's why we need
      this shadow, otherwise + operator could always be this custom + operator
     */

    final thisShadow = this;

    // if this == null && other == null, return 0
    if (thisShadow == null && other == null) {
      return 0 as T;
    }
    // if this != null && other == null, return this
    if (thisShadow != null && other == null) {
      return this as T;
    }
    // if this == null && other != null, return other
    else if (thisShadow == null && other != null) {
      return other;
    }
    // if this != null && other != null, return this + other
    else if (thisShadow != null && other != null) {
      return thisShadow + other as T;
    }
    // if this == null && other == null, return 0
    else {
      return 0 as T;
    }
  }
}
