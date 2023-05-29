void main(List<String> args) {
  // * Multiplying an Iterable

  const names = ['foo', 'bar', 'baz'];

  final result = names * 2;

  print(result);
}

extension Times<T> on Iterable<T> {
  Iterable<T> operator *(int times) sync* {
    for (var i = 0; i < times; i++) {
      yield* this;
    }
  }
}
