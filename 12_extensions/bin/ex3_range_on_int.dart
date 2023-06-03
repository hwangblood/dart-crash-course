void main(List<String> args) {
  // * Range on int

  /* 
    Dart does not support any range operators like Swift.
    https://developer.apple.com/documentation/swift/range
   */

  print(5.to(5));
  print(5.to(5, inclusive: false));

  print(5.to(10));
  print(5.to(10, inclusive: false));

  print(10.to(5));
  print(10.to(5, inclusive: false));
}

extension Range on int {
  Iterable<int> to(
    int end, {
    bool inclusive = true,
  }) =>
      end > this
          ? [for (var i = this; i < end; i++) i, if (inclusive) end]
          : [for (var i = this; i > end; i--) i, if (inclusive) end];
}
