void main(List<String> args) {
  // * Subtract An Iterable from Another Iterable

  print([1, 2, 3] - [1, 2]);
  print([1, 2, 3, 4] - [1, 4]);
  print([1, 2, 3] - [3, 2, 1]);

  print(["foo", "bar", "BAZ", "jim"] - ["bar", "baz"]);
  print(["foo", "bar", "BAZ", "jim"] - ["bar"]);
}

extension Remove<T> on Iterable<T> {
  Iterable<T> operator -(Iterable<T> other) => where(
        (element) => !other.contains(element),
      );
}
