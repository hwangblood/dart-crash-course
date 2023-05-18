void main(List<String> args) {
  // * For Loop over Map

  const info = {
    'name': 'John',
    'age': 30,
    'height': 1.8,
    'isMarried': false,
    'address': {
      'street': 'Main Street',
      'city': 'New York',
      'country': 'USA',
    },
  };

  for (final entry in info.entries) {
    if (entry.value is Map) {
      print('${entry.key}:');
      final mapValue = entry.value as Map<String, dynamic>;
      for (var innerEntry in mapValue.entries) {
        print('  ${innerEntry.key}: ${innerEntry.value}');
      }
    } else {
      print('${entry.key}: ${entry.value}');
    }
  }
}
