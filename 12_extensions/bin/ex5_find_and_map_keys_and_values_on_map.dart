void main(List<String> args) {
  // * Finding and Mapping Keys and Values on Map

  final json = {
    'name': 'Foo',
    'age': 23,
  };

  print(json.find('age', (value) => value));
  print(json.find<int>('age', (value) => value * 2));

  final String helloName = json.find(
    'name',
    (String value) => 'Hello, $value!',
  );
  print(helloName);

  final liveAddress = json.find<String>(
    'address',
    (value) => 'You live at $value',
  );
  print(liveAddress);
}

extension Find<K, V, R> on Map<K, V> {
  /// Try to find a value of the given key, if exists return the value produced
  /// by cast() function, otherwise return null
  R? find<T>(
    K key,
    R? Function(T value) cast,
  ) {
    final value = this[key];
    if (value != null && value is T) {
      return cast(value as T);
    } else {
      return null;
    }
  }
}
