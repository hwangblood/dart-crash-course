void main(List<String> args) {
  // * Custom Operators on Map

  // {'name': 'foo', 'age': 42} + {'address': '123 Main st'}
  print({'name': 'foo', 'age': 42} + {'address': '123 Main st'});
  print({'name': 'foo', 'age': 42} + {'age': 25});

  // {'name': 'foo', 'age': 42} - {'age': 42}
  print({'name': 'foo', 'age': 42} - {'age': 25});
  print({'name': 'foo', 'age': 42} - {'age': 42});

  // {'name': 'foo', 'age': 42} * 2
  print({'name': 'foo', 'age': 42} * 2);
  print({'name': 'foo', 'age': 42} * 0);
  print({'name': 'foo', 'age': 42} * -1);
}

extension MapOperators<K, V> on Map<K, V> {
  Map<K, V> operator +(Map<K, V> other) => {
        ...this,
        ...other,
      };

  Map<K, V> operator -(Map<K, V> other) => {...this}..removeWhere(
      (key, value) => other.containsKey(key) && other[key] == value,
    );

  Iterable<Map<K, V>> operator *(int times) sync* {
    for (var i = 0; i < times; i++) {
      yield this;
    }
  }
}
