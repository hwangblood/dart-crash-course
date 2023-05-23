import 'package:collection/collection.dart';

void main(List<String> args) {
  // * Unmodifiable Map Views

  final info = {
    'name': 'John',
    'age': 30,
    'address': {
      'street': 'Main Street',
      'city': 'New York',
    },
  };

  final readOnlyInfo = UnmodifiableMapView(info);

  info.addAll({'phone': '123-456-7890'});

  try {
    readOnlyInfo.addAll({'phone': '123-456-7890'});
  } catch (e) {
    print(e);
  }
}
